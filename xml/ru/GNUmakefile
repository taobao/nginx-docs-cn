LANG =		ru

DOCS =									\
		faq							\
		install							\
		windows							\
		events							\
		syntax							\
		example							\
		switches						\
		virtual_hosts						\
		control							\
		hash							\

DOCS_XML =	$(foreach name, $(DOCS), xml/$(LANG)/docs/$(name).xml)
DOCS_HTML =	$(foreach name, $(DOCS), $(OUT)/$(LANG)/docs/$(name).html)

FAQ =									\
		sys_errlist						\

FAQ_XML =	$(foreach name, $(FAQ), xml/$(LANG)/docs/$(name).xml)
FAQ_HTML =	$(foreach name, $(FAQ), $(OUT)/$(LANG)/docs/$(name).html)

REFS =									\
		ngx_core_module						\
		http/ngx_http_access_module				\
		http/ngx_http_addition_module				\
		http/ngx_http_auth_basic_module				\
		http/ngx_http_autoindex_module				\
		http/ngx_http_browser_module				\
		http/ngx_http_charset_module				\
		http/ngx_http_core_module				\
		http/ngx_http_dav_module				\
		http/ngx_http_empty_gif_module				\
		http/ngx_http_fastcgi_module				\
		http/ngx_http_flv_module				\
		http/ngx_http_geo_module				\
		http/ngx_http_geoip_module				\
		http/ngx_http_gzip_module				\
		http/ngx_http_gzip_static_module			\
		http/ngx_http_headers_module				\
		http/ngx_http_image_filter_module			\
		http/ngx_http_index_module				\
		http/ngx_http_limit_conn_module				\
		http/ngx_http_limit_req_module				\
		http/ngx_http_limit_zone_module				\
		http/ngx_http_log_module				\
		http/ngx_http_map_module				\
		http/ngx_http_memcached_module				\
		http/ngx_http_mp4_module				\
		http/ngx_http_perl_module				\
		http/ngx_http_proxy_module				\
		http/ngx_http_random_index_module			\
		http/ngx_http_realip_module				\
		http/ngx_http_referer_module				\
		http/ngx_http_rewrite_module				\
		http/ngx_http_secure_link_module			\
		http/ngx_http_split_clients_module			\
		http/ngx_http_ssi_module				\
		http/ngx_http_ssl_module				\
		http/ngx_http_sub_module				\
		http/ngx_http_upstream_module				\
		http/ngx_http_userid_module				\
		http/ngx_http_xslt_module				\

REFS_XML =	$(foreach name, $(REFS), xml/$(LANG)/docs/$(name).xml)
REFS_HTML =	$(foreach name, $(REFS), $(OUT)/$(LANG)/docs/$(name).html)

$(LANG):								\
		$(OUT)/$(LANG)/index.html				\
		$(OUT)/$(LANG)/download.html				\
		$(OUT)/$(LANG)/support.html				\
		$(OUT)/$(LANG)/docs/index.html				\
		$(DOCS_HTML)						\
		$(REFS_HTML)						\
		$(FAQ_HTML)						\

$(OUT)/$(LANG)/download.html:						\
		xml/$(LANG)/download.xml				\
		$(DOWNLOAD_DEPS)
	$(call XSLT, xslt/download.xslt, $<, $@)

$(OUT)/$(LANG)/docs/faq.html:						\
		$(FAQ_XML)						\
