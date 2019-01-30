.PHONY: configmap

configmap:
	-kubectl delete secret osg-head-prp-sdsc-config -n osg
	kubectl create secret generic osg-head-prp-sdsc-config -n osg --from-file=pool_password

