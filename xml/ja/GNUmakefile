DOC_LANG =	ja

DOCS =									\
		introduction						\
		howto							\
		faq							\

DOCS_XML =	$(foreach name, $(DOCS), xml/$(DOC_LANG)/docs/$(name).xml)
DOCS_HTML =	$(foreach name, $(DOCS), $(OUT)/$(DOC_LANG)/docs/$(name).html)

INTRO =									\
		http/request_processing					\
		http/server_names					\
		http/configuring_https_servers				\

INTRO_XML =	$(foreach name, $(INTRO), xml/$(DOC_LANG)/docs/$(name).xml)
INTRO_HTML =	$(foreach name, $(INTRO), $(OUT)/$(DOC_LANG)/docs/$(name).html)

HOWTO =									\
		debugging_log						\
		http/converting_rewrite_rules				\

HOWTO_XML =	$(foreach name, $(HOWTO), xml/$(DOC_LANG)/docs/$(name).xml)
HOWTO_HTML =	$(foreach name, $(HOWTO), $(OUT)/$(DOC_LANG)/docs/$(name).html)

FAQ =									\
		sys_errlist						\

FAQ_XML =	$(foreach name, $(FAQ), xml/$(DOC_LANG)/docs/$(name).xml)
FAQ_HTML =	$(foreach name, $(FAQ), $(OUT)/$(DOC_LANG)/docs/$(name).html)

$(DOC_LANG):								\
		$(OUT)/$(DOC_LANG)/index.html				\
		$(OUT)/$(DOC_LANG)/docs/index.html			\
		$(DOCS_HTML)						\
		$(INTRO_HTML)						\
		$(HOWTO_HTML)						\
		$(FAQ_HTML)						\

$(OUT)/$(DOC_LANG)/docs/index.html:					\
		$(DOCS_XML)						\

$(OUT)/$(DOC_LANG)/docs/introduction.html:				\
		$(INTRO_XML)						\

$(OUT)/$(DOC_LANG)/docs/howto.html:					\
		$(HOWTO_XML)						\

$(OUT)/$(DOC_LANG)/docs/faq.html:					\
		$(FAQ_XML)						\
