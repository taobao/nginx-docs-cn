DOC_LANG =	en

DOCS =									\
		faq							\
		install							\
		windows							\
		events							\
		syntax							\
		control							\
		hash							\
		dirindex						\
		http/request_processing					\
		http/server_names					\
		http/configuring_https_servers				\
		debugging_log						\
		http/converting_rewrite_rules				\
		howto_build_on_win32					\
		freebsd_tuning						\
		howto_setup_development_environment_on_ec2		\
		nginx_dtrace_pid_provider				\

DOCS_XML =	$(foreach name, $(DOCS), xml/$(DOC_LANG)/docs/$(name).xml)
DOCS_HTML =	$(foreach name, $(DOCS), $(OUT)/$(DOC_LANG)/docs/$(name).html)

FAQ =									\
		welcome_nginx_facebook					\
		faq/license_copyright					\
		faq/accept_failed					\
		faq/variables_in_config					\
		faq/daemon_master_process_off				\
		faq/chunked_encoding_from_backend			\
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
		http/ngx_http_gunzip_module				\
		http/ngx_http_gzip_module				\
		http/ngx_http_gzip_static_module			\
		http/ngx_http_headers_module				\
		http/ngx_http_image_filter_module			\
		http/ngx_http_index_module				\
		http/ngx_http_limit_conn_module				\
		http/ngx_http_limit_req_module				\
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
		mail/ngx_mail_auth_http_module				\
		mail/ngx_mail_core_module				\
		mail/ngx_mail_imap_module				\
		mail/ngx_mail_pop3_module				\
		mail/ngx_mail_proxy_module				\
		mail/ngx_mail_smtp_module				\
		mail/ngx_mail_ssl_module				\

REFS_XML =	$(foreach name, $(REFS), xml/$(DOC_LANG)/docs/$(name).xml)
REFS_HTML =	$(foreach name, $(REFS), $(OUT)/$(DOC_LANG)/docs/$(name).html)

$(DOC_LANG):								\
		$(OUT)/$(DOC_LANG)/index.html				\
		$(OUT)/$(DOC_LANG)/download.html			\
		$(OUT)/$(DOC_LANG)/security_advisories.html		\
		$(OUT)/$(DOC_LANG)/pgp_keys.html		\
		$(OUT)/$(DOC_LANG)/docs/index.html			\
		$(DOCS_HTML)						\
		$(REFS_HTML)						\
		$(INTRO_HTML)						\
		$(HOWTO_HTML)						\
		$(FAQ_HTML)						\
		$(OUT)/$(DOC_LANG)/links.html				\
		$(OUT)/$(DOC_LANG)/books.html				\
		$(OUT)/$(DOC_LANG)/support.html				\
		$(OUT)/$(DOC_LANG)/donation.html			\

$(OUT)/$(DOC_LANG)/download.html:					\
		xml/$(DOC_LANG)/download.xml				\
		$(DOWNLOAD_DEPS)
	$(call XSLT, xslt/download.xslt, $<, $@)

$(OUT)/$(DOC_LANG)/security_advisories.html:				\
		xml/$(DOC_LANG)/security_advisories.xml			\
		$(SECURITY_DEPS)
	$(call XSLT, xslt/security.xslt, $<, $@)

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

$(OUT)/$(DOC_LANG)/docs/faq.html:					\
		$(FAQ_XML)						\

$(OUT)/$(DOC_LANG)/books.html:						\
		xml/$(DOC_LANG)/books.xml				\
		$(BOOK_DEPS)
	$(call XSLT, xslt/books.xslt, $<, $@)
