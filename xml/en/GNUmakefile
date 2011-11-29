LANG =		en

DOCS =									\
		introduction						\
		howto							\
		faq							\
		windows							\
		control							\

DOCS_XML =	$(foreach name, $(DOCS), xml/$(LANG)/docs/$(name).xml)
DOCS_HTML =	$(foreach name, $(DOCS), $(OUT)/$(LANG)/docs/$(name).html)

INTRO =									\
		http/request_processing					\
		http/server_names					\
		http/configuring_https_servers				\

INTRO_XML =	$(foreach name, $(INTRO), xml/$(LANG)/docs/$(name).xml)
INTRO_HTML =	$(foreach name, $(INTRO), $(OUT)/$(LANG)/docs/$(name).html)

HOWTO =									\
		debugging_log						\
		http/converting_rewrite_rules				\
		howto_build_on_win32					\
		freebsd_tuning						\

HOWTO_XML =	$(foreach name, $(HOWTO), xml/$(LANG)/docs/$(name).xml)
HOWTO_HTML =	$(foreach name, $(HOWTO), $(OUT)/$(LANG)/docs/$(name).html)

FAQ =									\
		welcome_nginx_facebook					\
		faq/license_copyright					\
		faq/accept_failed					\
		faq/variables_in_config					\
		faq/daemon_master_process_off				\
		faq/chunked_encoding_from_backend			\
		sys_errlist						\

FAQ_XML =	$(foreach name, $(FAQ), xml/$(LANG)/docs/$(name).xml)
FAQ_HTML =	$(foreach name, $(FAQ), $(OUT)/$(LANG)/docs/$(name).html)

REFS =									\
		ngx_core_module						\
		http/ngx_http_core_module				\
		http/ngx_http_empty_gif_module				\
		http/ngx_http_flv_module				\
		http/ngx_http_image_filter_module			\
		http/ngx_http_index_module				\
		http/ngx_http_limit_conn_module				\
		http/ngx_http_limit_req_module				\
		http/ngx_http_mp4_module				\
		http/ngx_http_random_index_module			\

REFS_XML =	$(foreach name, $(REFS), xml/$(LANG)/docs/$(name).xml)
REFS_HTML =	$(foreach name, $(REFS), $(OUT)/$(LANG)/docs/$(name).html)

$(LANG):								\
		$(OUT)/$(LANG)/index.html				\
		$(OUT)/$(LANG)/download.html				\
		$(OUT)/$(LANG)/security_advisories.html			\
		$(OUT)/$(LANG)/docs/index.html				\
		$(DOCS_HTML)						\
		$(REFS_HTML)						\
		$(INTRO_HTML)						\
		$(HOWTO_HTML)						\
		$(FAQ_HTML)						\
		$(OUT)/$(LANG)/links.html				\
		$(OUT)/$(LANG)/books.html				\
		$(OUT)/$(LANG)/support.html				\
		$(OUT)/$(LANG)/donation.html				\

$(OUT)/$(LANG)/download.html:						\
		xml/$(LANG)/download.xml				\
		$(DOWNLOAD_DEPS)
	$(call XSLT, xslt/download.xslt, $<, $@)

$(OUT)/$(LANG)/security_advisories.html:				\
		xml/$(LANG)/security_advisories.xml			\
		$(SECURITY_DEPS)
	$(call XSLT, xslt/security.xslt, $<, $@)

$(OUT)/$(LANG)/docs/index.html:						\
		$(DOCS_XML)						\
		$(REFS_XML)						\

$(OUT)/$(LANG)/docs/introduction.html:					\
		$(INTRO_XML)						\

$(OUT)/$(LANG)/docs/howto.html:						\
		$(HOWTO_XML)						\

$(OUT)/$(LANG)/docs/faq.html:						\
		$(FAQ_XML)						\

$(OUT)/$(LANG)/books.html:						\
		xml/$(LANG)/books.xml					\
		$(BOOK_DEPS)
	$(call XSLT, xslt/books.xslt, $<, $@)
