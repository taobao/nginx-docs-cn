
DOCS_RU =	ru/docs/faq						\
		ru/docs/control						\
		ru/docs/events						\
		ru/docs/example						\
		ru/docs/hash						\
		ru/docs/install						\
		ru/docs/ngx_core_module					\
		ru/docs/switches					\
		ru/docs/syntax						\
		ru/docs/virtual_hosts					\
		ru/docs/windows						\
		ru/docs/http/ngx_http_access_module			\
		ru/docs/http/ngx_http_addition_module			\
		ru/docs/http/ngx_http_auth_basic_module			\
		ru/docs/http/ngx_http_autoindex_module			\
		ru/docs/http/ngx_http_browser_module			\
		ru/docs/http/ngx_http_charset_module			\
		ru/docs/http/ngx_http_core_module			\
		ru/docs/http/ngx_http_dav_module			\
		ru/docs/http/ngx_http_empty_gif_module			\
		ru/docs/http/ngx_http_fastcgi_module			\
		ru/docs/http/ngx_http_flv_module			\
		ru/docs/http/ngx_http_geo_module			\
		ru/docs/http/ngx_http_geoip_module			\
		ru/docs/http/ngx_http_gzip_module			\
		ru/docs/http/ngx_http_gzip_static_module		\
		ru/docs/http/ngx_http_headers_module			\
		ru/docs/http/ngx_http_image_filter_module		\
		ru/docs/http/ngx_http_index_module			\
		ru/docs/http/ngx_http_limit_conn_module			\
		ru/docs/http/ngx_http_limit_req_module			\
		ru/docs/http/ngx_http_limit_zone_module			\
		ru/docs/http/ngx_http_log_module			\
		ru/docs/http/ngx_http_map_module			\
		ru/docs/http/ngx_http_memcached_module			\
		ru/docs/http/ngx_http_mp4_module			\
		ru/docs/http/ngx_http_perl_module			\
		ru/docs/http/ngx_http_proxy_module			\
		ru/docs/http/ngx_http_random_index_module		\
		ru/docs/http/ngx_http_realip_module			\
		ru/docs/http/ngx_http_referer_module			\
		ru/docs/http/ngx_http_rewrite_module			\
		ru/docs/http/ngx_http_secure_link_module		\
		ru/docs/http/ngx_http_split_clients_module		\
		ru/docs/http/ngx_http_ssi_module			\
		ru/docs/http/ngx_http_ssl_module			\
		ru/docs/http/ngx_http_sub_module			\
		ru/docs/http/ngx_http_upstream_module			\
		ru/docs/http/ngx_http_userid_module			\
		ru/docs/http/ngx_http_xslt_module			\

DOCS_RU_XML =	$(foreach name, $(DOCS_RU), xml/$(name).xml)
DOCS_RU_HTML =	$(foreach name, $(DOCS_RU), $(OUT)/$(name).html)

FAQ_RU =	ru/docs/sys_errlist					\

FAQ_RU_XML =	$(foreach name, $(FAQ_RU), xml/$(name).xml)
FAQ_RU_HTML =	$(foreach name, $(FAQ_RU), $(OUT)/$(name).html)

ru:									\
		$(OUT)/ru/index.html					\
		$(OUT)/ru/download.html					\
		$(OUT)/ru/support.html					\
		$(OUT)/ru/docs/index.html				\
		$(DOCS_RU_HTML)						\
		$(FAQ_RU_HTML)						\

$(OUT)/ru/download.html:						\
		xml/ru/download.xml					\
		$(DOWNLOAD_DEPS)
	$(call XSLT, xslt/download.xslt, $<, $@)

$(OUT)/ru/docs/faq.html:						\
		xml/ru/docs/faq.xml					\
		$(FAQ_RU_XML)						\
		$(ARTICLE_DEPS)
	$(call XSLT, xslt/article.xslt, $<, $@)
