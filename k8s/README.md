# K8S

Elementos da arquitetura de um K8S

Control Plane ou Worker Node

- Control Plane que é o orquestrador do cluster.
    - API Server, responsável pela comunicação e interação com os nodes (kubectl)
    - ETCD, banco "chave:valor", onde os dados são armazenados, deployments, pods, etc.
    - Scheduler, ele que decide onde os pods serão criados 
    - Controller Manager, controladores do kubernetes
    - Cloud Controller Manager, utilizado em clouds públicas (aws, gcp, azure), em cloud privado não tem

- Worker Node 
    - kube proxy, comunicação de rede
    - kubelet, garante a execução dos containers no nodes, verifica a saúde, se comunica com container runtime
    - Container runtime, interface de comunicação, ContainerD

Ferramentas para criação: 

- LOCAL: k3d, minikube, kind, k3s
- ON PREMISES: RKE, KUBEADM
- KAAS: AKS, EKS, GKE

Como criar ?

- LOCAL: Fazer as instalações
    - Consultar páginda de cada ferramenta

- ON PREMISES:
    - [Instalar Docker](./docker.md)
    - [Instalar RKE](./rke.md)
    - [Instalar Rancher](./rancher.md)


- KAAS:
    - 

