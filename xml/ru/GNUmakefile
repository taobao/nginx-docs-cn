DOC_LANG =	ru

DOCS =									\
		howto							\
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
		dirindex						\

DOCS_XML =	$(foreach name, $(DOCS), xml/$(DOC_LANG)/docs/$(name).xml)
DOCS_HTML =	$(foreach name, $(DOCS), $(OUT)/$(DOC_LANG)/docs/$(name).html)

HOWTO =									\
		debugging_log						\

HOWTO_XML =	$(foreach name, $(HOWTO), xml/$(DOC_LANG)/docs/$(name).xml)
HOWTO_HTML =	$(foreach name, $(HOWTO), $(OUT)/$(DOC_LANG)/docs/$(name).html)

FAQ =									\
		sys_errlist						\

FAQ_XML =	$(foreach name, $(FAQ), xml/$(DOC_LANG)/docs/$(name).xml)
FAQ_HTML =	$(foreach name, $(FAQ), $(OUT)/$(DOC_LANG)/docs/$(name).html)

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

REFS_XML =	$(foreach name, $(REFS), xml/$(DOC_LANG)/docs/$(name).xml)
REFS_HTML =	$(foreach name, $(REFS), $(OUT)/$(DOC_LANG)/docs/$(name).html)

$(DOC_LANG):								\
		$(OUT)/$(DOC_LANG)/index.html				\
		$(OUT)/$(DOC_LANG)/download.html			\
		$(OUT)/$(DOC_LANG)/support.html				\
		$(OUT)/$(DOC_LANG)/docs/index.html			\
		$(DOCS_HTML)						\
		$(REFS_HTML)						\
		$(HOWTO_HTML)						\
		$(FAQ_HTML)						\

$(OUT)/$(DOC_LANG)/download.html:					\
		xml/$(DOC_LANG)/download.xml				\
		$(DOWNLOAD_DEPS)
	$(call XSLT, xslt/download.xslt, $<, $@)

$(OUT)/$(DOC_LANG)/docs/index.html:					\
		$(DOCS_XML)						\
		$(REFS_XML)						\

xml/$(DOC_LANG)/docs/dirindex.xml:					\
		$(REFS_XML)						\
		xslt/dirindex.xslt
	echo "<modules>$(patsubst %,					\
	<module name=\"%\"/>, $(filter %.xml,$^))</modules>" |		\
	xsltproc -o -							\
	--stringparam LANG $(patsubst xml/%/docs/dirindex.xml,%,$@)	\
	xslt/dirindex.xslt - |						\
	sed 's;xml/[^/]*/docs/;;g' > $@

$(OUT)/$(DOC_LANG)/docs/howto.html:					\
		$(HOWTO_XML)						\

$(OUT)/$(DOC_LANG)/docs/faq.html:					\
		$(FAQ_XML)						\
