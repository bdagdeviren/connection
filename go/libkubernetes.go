package main

import "C"
import (
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
	"k8s.io/client-go/kubernetes"
	"k8s.io/client-go/rest"
	"os"
)

//type YamlFile struct {
//	WaitTime int64 `yaml:"waitTime"`
//	Deployment []Deployment `yaml:"deployment"`
//}
//
//type Deployment struct {
//	Name string `yaml:"name"`
//	Path string `yaml:"path"`
//	Wait Wait `yaml:"wait"`
//}
//
//type Wait struct {
//	Name string `yaml:"name"`
//	Namespace string `yaml:"namespace"`
//}
//
//func Client() (*kubernetes.Clientset,error) {
//	config, err := rest.InClusterConfig()
//	if err != nil {
//		return nil,err
//	}
//	// creates the clientset
//	clientset, err := kubernetes.NewForConfig(config)
//	if err != nil {
//		return nil,err
//	}
//
//	return clientset,nil
//}
//
////export create_yaml
//func create_yaml(path *C.char) (rc int,result *C.char,errStr *C.char) {
//	file, err := ioutil.ReadFile(C.GoString(path))
//	if err != nil {
//		return -1, nil, C.CString(err.Error())
//	}
//
//	c := klient.New("", "")
//	err = c.Create(file)
//	if err != nil {
//		return -1, nil, C.CString(err.Error())
//	}
//
//	resultFile := "Successfully create "+C.GoString(path)+" file!"
//	return 0,C.CString(resultFile),nil
//}
//
////export update_yaml
//func update_yaml(path *C.char) (rc int,result *C.char,errStr *C.char) {
//	file, err := ioutil.ReadFile(C.GoString(path))
//	if err != nil {
//		return -1, nil, C.CString(err.Error())
//	}
//
//	c := klient.New("", "")
//	err = c.Replace(file)
//	if err != nil {
//		return -1, nil, C.CString(err.Error())
//	}
//
//	resultFile := "Successfully update "+C.GoString(path)+" file!"
//	return 0,C.CString(resultFile),nil
//}
//
////export delete_yaml
//func delete_yaml(path *C.char) (rc int,result *C.char,errStr *C.char) {
//	file, err := ioutil.ReadFile(C.GoString(path))
//	if err != nil {
//		return -1, nil, C.CString(err.Error())
//	}
//
//	c := klient.New("", "")
//	err = c.Delete(file)
//	if err != nil {
//		return -1, nil, C.CString(err.Error())
//	}
//
//	resultFile := "Successfully delete "+C.GoString(path)+" file!"
//	return 0,C.CString(resultFile),nil
//}
//
////export apply_yaml
//func apply_yaml(path *C.char) (rc int,result *C.char,errStr *C.char) {
//	file, err := ioutil.ReadFile(C.GoString(path))
//	if err != nil {
//		return -1, nil, C.CString(err.Error())
//	}
//
//	c := klient.New("", "")
//	err = c.Apply(file)
//	if err != nil {
//		return -1, nil, C.CString(err.Error())
//	}
//
//	resultFile := "Successfully apply "+C.GoString(path)+" file!"
//	return 0,C.CString(resultFile),nil
//}
//
////export check_pod_status
//func CheckPodsStatus(namespace *C.char,podName *C.char) (rc int,result *C.char,errStr *C.char) {
//	clientset := Client()
//	isDeployed := false
//
//	pods, err := clientset.CoreV1().Pods(C.GoString(namespace)).List(metav1.ListOptions{})
//	if err != nil {
//		return -1, nil, C.CString(err.Error())
//	}
//
//	for _, element := range pods.Items {
//		if strings.Contains(element.Name, C.GoString(podName)) {
//			if element.Status.Phase == "Running" {
//				isDeployed = true
//			} else {
//				isDeployed = false
//			}
//		}
//	}
//
//	resultGo := ""
//	if isDeployed != false {
//		resultGo = "Deployment Successfully - Name: "+C.GoString(podName)+", Namespace: "+namespace
//		return 0, C.CString(resultGo), nil
//	} else {
//		resultGo = "Waiting Pod Deployment - Name: "+C.GoString(podName)+", Namespace: "+ C.GoString(namespace)
//		return -1, C.CString(resultGo), nil
//	}
//}
//
////export yaml_to_json
//func YamlToJson(path *C.char,file *C.char) (rc int,result *C.char,errStr *C.char) {
//	yamlFile := YamlFile{}
//
//
//	file, err := ioutil.ReadFile(filepath.Join(path,file))
//	if err != nil {
//		return -1, nil, C.CString(err.Error())
//	}
//
//	err = yaml.Unmarshal(file, &yamlFile)
//	if err != nil {
//		return -1, nil, C.CString(err.Error())
//	}
//
//	b, err := json.Marshal(yamlFile)
//	if err != nil {
//		return -1, nil, C.CString(err.Error())
//	}
//
//	return 0, C.CString(string(b)), nil
//}

func Client() (*kubernetes.Clientset,error) {
	config, err := rest.InClusterConfig()
	if err != nil {
		return nil,err
	}
	// creates the clientset
	clientset, err := kubernetes.NewForConfig(config)
	if err != nil {
		return nil,err
	}

	return clientset,nil
}

//export get_secret
func get_secret(namespace *C.char,name *C.char,file *C.char) (rc int,result *C.char,errStr *C.char) {
	client,err := Client()

	pods, err := client.CoreV1().Secrets(C.GoString(namespace)).Get(C.GoString(name),metav1.GetOptions{})
	if err != nil {
		return -1, nil, C.CString(err.Error())
	}

    if val, ok := pods.Data[C.GoString(file)]; ok {
        f, err := os.Create(C.GoString(file))
        if err != nil {
        	return -1, nil, C.CString(err.Error())
        }

        _, err = f.Write(val)
        if err != nil {
            return -1, nil, C.CString(err.Error())
        }

        err = f.Close()
        if err != nil {
            return -1, nil, C.CString(err.Error())
        }
    }else {
        return -1, nil, C.CString("File not found!")
    }


	return 0, C.CString("Successfully getting certificate!"), nil
}

func main() {


}