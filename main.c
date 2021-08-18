#include <log.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netdb.h>
#include <string.h>
#include <sys/types.h>
#include "libs/kubernetes/libkubernetes.h"
#include <curl/curl.h>

void check_port(char* hostname, int portno){
    log_info("Checking -> Hostname: %s, Port: %d",hostname,portno);

    while (1) {

        int value;
        int sockfd;
        struct sockaddr_in serv_addr;
        struct hostent *server;

        sockfd = socket(AF_INET, SOCK_STREAM, 0);
        if (sockfd < 0) {
            log_error("ERROR opening socket");
        }

        server = gethostbyname(hostname);

        if (server == NULL) {
            log_error("ERROR, no such host\n");
        }

        bzero((char *) &serv_addr, sizeof(serv_addr));
        serv_addr.sin_family = AF_INET;
        bcopy((char *) server->h_addr,
              (char *) &serv_addr.sin_addr.s_addr,
              server->h_length);

        serv_addr.sin_port = htons(portno);
        if (connect(sockfd, (struct sockaddr *) &serv_addr, sizeof(serv_addr)) < 0) {
            log_info("Port is closed. Waiting application open...");
        } else {
            log_info("Port is active. Application started!");
            break;
        }

        close(sockfd);

        sleep(1.5);
    }
}

void secret(char* namespace,char* name,char* filename){
    while (1) {
        struct get_secret_return get_secret_return;
        get_secret_return = get_secret(namespace, name, filename);
        if (get_secret_return.r0 != 0) {
            log_error(get_secret_return.r2);
        } else {
            log_info(get_secret_return.r1);
            break;
        }
        sleep(2);
    }
}

void check_certificate(){
    while (1) {
        CURL *curl;
        CURLcode res;

        int response = 0;

        curl = curl_easy_init();
        if (curl) {
            FILE *devnull = fopen("/dev/null", "w+");
            curl_easy_setopt(curl, CURLOPT_WRITEDATA, devnull);
            curl_easy_setopt(curl, CURLOPT_URL, "https://cert-manager-webhook.cert-manager.svc:443");
            /* example.com is redirected, so we tell libcurl to follow redirection */
            curl_easy_setopt(curl, CURLOPT_FOLLOWLOCATION, 1L);
            curl_easy_setopt(curl, CURLOPT_CAINFO, "ca.crt");
            curl_easy_setopt(curl, CURLOPT_SSL_VERIFYPEER, 1);

            /* Perform the request, res will get the return code */
            res = curl_easy_perform(curl);
            /* Check for errors */
            if (res != CURLE_OK) {
                log_error(curl_easy_strerror(res));
                response = -1;
            }

            /* always cleanup */
            curl_easy_cleanup(curl);
            fclose(devnull);

            if(response == 0){
                break;
            }

            sleep(2);
        }
    }
}

int main(int argc, char *argv[])
{
    check_port("cert-manager-webhook.cert-manager.svc",443);
    secret("cert-manager","cert-manager-webhook-ca","ca.crt");
    check_certificate();
    return 0;
}
