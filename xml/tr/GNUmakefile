
DOCS_TR =	tr/docs/windows						\
		tr/docs/introduction					\
		tr/docs/howto						\
		tr/docs/faq						\

DOCS_TR_XML =	$(foreach name, $(DOCS_TR), xml/$(name).xml)
DOCS_TR_HTML =	$(foreach name, $(DOCS_TR), $(OUT)/$(name).html)

INTRO_TR =	tr/docs/http/request_processing				\
		tr/docs/http/configuring_https_servers			\
		tr/docs/http/server_names				\

INTRO_TR_XML =	$(foreach name, $(INTRO_TR), xml/$(name).xml)
INTRO_TR_HTML =	$(foreach name, $(INTRO_TR), $(OUT)/$(name).html)

HOWTO_TR =	tr/docs/debugging_log					\
		tr/docs/http/converting_rewrite_rules			\

HOWTO_TR_XML =	$(foreach name, $(HOWTO_TR), xml/$(name).xml)
HOWTO_TR_HTML =	$(foreach name, $(HOWTO_TR), $(OUT)/$(name).html)

FAQ_TR =	tr/docs/sys_errlist					\

FAQ_TR_XML =	$(foreach name, $(FAQ_TR), xml/$(name).xml)
FAQ_TR_HTML =	$(foreach name, $(FAQ_TR), $(OUT)/$(name).html)

tr:									\
		$(OUT)/tr/index.html					\
		$(OUT)/tr/docs/index.html				\
		$(DOCS_TR_HTML)						\
		$(INTRO_TR_HTML)					\
		$(HOWTO_TR_HTML)					\
		$(FAQ_TR_HTML)						\

$(OUT)/tr/docs/introduction.html:					\
		xml/tr/docs/introduction.xml				\
		$(INTRO_TR_XML)						\
		$(ARTICLE_DEPS)
	$(call XSLT, xslt/article.xslt, $<, $@)

$(OUT)/tr/docs/howto.html:						\
		xml/tr/docs/howto.xml					\
		$(HOWTO_TR_XML)						\
		$(ARTICLE_DEPS)
	$(call XSLT, xslt/article.xslt, $<, $@)

$(OUT)/tr/docs/faq.html:						\
		xml/tr/docs/faq.xml					\
		$(FAQ_TR_XML)						\
		$(ARTICLE_DEPS)
	$(call XSLT, xslt/article.xslt, $<, $@)
