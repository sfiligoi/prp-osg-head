.PHONY: configmap

configmap:
	-kubectl delete secret osg-head-prp-sdsc-config -n osg
	kubectl create secret generic osg-head-prp-sdsc-config -n osg \
          --from-file=pool_password \
          --from-file=pod_init.sh \
          --from-file=30-osg-gip.ini --from-file=40-osg-siteinfo.ini \
          --from-file=grid-mapfile

