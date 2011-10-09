
DOCS_EN =	en/docs/windows						\
		en/docs/introduction					\
		en/docs/howto						\
		en/docs/faq						\

DOCS_EN_XML =	$(foreach name, $(DOCS_EN), xml/$(name).xml)
DOCS_EN_HTML =	$(foreach name, $(DOCS_EN), $(OUT)/$(name).html)

INTRO_EN =	en/docs/http/request_processing				\
		en/docs/http/configuring_https_servers			\
		en/docs/http/server_names				\

INTRO_EN_XML =	$(foreach name, $(INTRO_EN), xml/$(name).xml)
INTRO_EN_HTML =	$(foreach name, $(INTRO_EN), $(OUT)/$(name).html)

HOWTO_EN =	en/docs/debugging_log					\
		en/docs/http/converting_rewrite_rules			\
		en/docs/freebsd_tuning					\

REFS_EN_XML =	$(foreach name, $(REFS_EN), xml/$(name).xml)
REFS_EN_HTML =	$(foreach name, $(REFS_EN), $(OUT)/$(name).html)

REFS_EN =	en/docs/ngx_core_module					\
		en/docs/http/ngx_http_core_module			\
		en/docs/http/ngx_http_mp4_module			\

HOWTO_EN_XML =	$(foreach name, $(HOWTO_EN), xml/$(name).xml)
HOWTO_EN_HTML =	$(foreach name, $(HOWTO_EN), $(OUT)/$(name).html)

FAQ_EN =	en/docs/sys_errlist					\
		en/docs/welcome_nginx_facebook

FAQ_EN_XML =	$(foreach name, $(FAQ_EN), xml/$(name).xml)
FAQ_EN_HTML =	$(foreach name, $(FAQ_EN), $(OUT)/$(name).html)

en:									\
		$(OUT)/en/index.html					\
		$(OUT)/en/download.html					\
		$(OUT)/en/security_advisories.html			\
		$(OUT)/en/books.html					\
		$(OUT)/en/links.html					\
		$(OUT)/en/support.html					\
		$(OUT)/en/donation.html					\
		$(OUT)/en/docs/index.html				\
		$(DOCS_EN_HTML)						\
		$(INTRO_EN_HTML)					\
		$(REFS_EN_HTML)						\
		$(HOWTO_EN_HTML)					\
		$(FAQ_EN_HTML)						\

$(OUT)/en/docs/index.html:						\
		xml/en/docs/index.xml					\
		$(DOCS_EN_XML)						\
		$(REFS_EN_XML)						\
		$(ARTICLE_DEPS)
	$(call XSLT, xslt/article.xslt, $<, $@)

$(OUT)/en/download.html:						\
		xml/en/download.xml					\
		$(DOWNLOAD_DEPS)
	$(call XSLT, xslt/download.xslt, $<, $@)

$(OUT)/en/security_advisories.html:					\
		xml/en/security_advisories.xml				\
		$(SECURITY_DEPS)
	$(call XSLT, xslt/security.xslt, $<, $@)

$(OUT)/en/docs/introduction.html:					\
		xml/en/docs/introduction.xml				\
		$(INTRO_EN_XML)						\
		$(ARTICLE_DEPS)
	$(call XSLT, xslt/article.xslt, $<, $@)

$(OUT)/en/docs/howto.html:						\
		xml/en/docs/howto.xml					\
		$(HOWTO_EN_XML)						\
		$(ARTICLE_DEPS)
	$(call XSLT, xslt/article.xslt, $<, $@)

$(OUT)/en/docs/faq.html:						\
		xml/en/docs/faq.xml					\
		$(FAQ_EN_XML)						\
		$(ARTICLE_DEPS)
	$(call XSLT, xslt/article.xslt, $<, $@)

$(OUT)/en/books.html:							\
		xml/en/books.xml					\
		$(BOOK_DEPS)
	$(call XSLT, xslt/books.xslt, $<, $@)
