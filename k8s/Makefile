.PHONY: configmap

configmap:
	-kubectl delete secret osg-head-prp-sdsc-config -n osg
	kubectl create secret generic osg-head-prp-sdsc-config -n osg \
          --from-file=pool_password \
          --from-file=80_pod_init.sh \
          --from-file=01-osg-squid.ini --from-file=30-osg-gip.ini --from-file=40-osg-siteinfo.ini \
          --from-file=grid-mapfile 
	# kubectl create secret generic osg-head-prp-sdsc-config -n osg \
          --from-file=pool_password \
          --from-file=80_pod_init.sh \
          --from-file=01-osg-squid.ini --from-file=30-osg-gip.ini --from-file=40-osg-siteinfo.ini \
          --from-file=grid-mapfile  -o yaml --dry-run |kubectl replace -f -
