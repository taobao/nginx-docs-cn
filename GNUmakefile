
OUT =		libxslt
TEXT =		text
ZIP =		gzip
NGINX_ORG =	/data/jails/www/usr/local/www/nginx.org

CP =		$(HOME)/java
RSYNC =		rsync -rtc


define	XSLScript
	java -cp $(CP)/xsls/saxon.jar:$(CP)/xsls/xsls.jar		\
		com.pault.StyleSheet					\
		-x com.pault.XX -y com.pault.XX				\
		$(1) xsls/dump.xsls					\
	| perl -e 'undef $$/; $$_ = <>; s/(\n\n)+/\n/gs; print'	> $(2)

	if [ ! -s $(2) ]; then rm $(2); fi; test -s $(2)
endef


define	XSLT
	xsltproc -o $3							\
		$(shell echo $4						\
		| sed -e "s/\([^= ]*\)=\([^= ]*\)/--param \1 \"'\2'\"/g") \
		$1 $2
endef

define	GZIP
		rm -f $1.gz
		7za a -tgzip -mx9 -mpass=15 -si -ba -bd $1.gz < $1
		touch -r $1 $1.gz
endef

define 	JPEGNORM
	jpegtopnm $1							\
		| pamscale -width=150					\
		| pnmtojpeg -quality=95 -optimize -dct=float		\
		> $2
endef

all:		news arx 404 en ja he ru tr

news:		$(OUT)/index.html $(OUT)/index.rss
arx:		$(OUT)/2010.html $(OUT)/2009.html
404:		$(OUT)/404.html


ARTICLE_XSLT =	xml/menu.xml						\
		xml/versions.xml					\
		xslt/article.xslt					\
		dtd/article.dtd						\
		dtd/content.dtd						\

include 	xml/en/GNUmakefile
include 	xml/ja/GNUmakefile
include 	xml/he/GNUmakefile
include 	xml/ru/GNUmakefile
include 	xml/tr/GNUmakefile


$(OUT)/index.html:	xml/index.xml					\
		xml/menu.xml						\
		xslt/news.xslt						\
		dtd/news.dtd						\
		dtd/content.dtd
	$(call XSLT, xslt/news.xslt, $<, $@)

$(OUT)/index.rss:	xml/index.xml					\
		xslt/rss.xslt						\
		dtd/article.dtd						\
		dtd/content.dtd
	$(call XSLT, xslt/rss.xslt, $<, $@)


$(OUT)/2010.html:	xml/index.xml					\
		xml/menu.xml						\
		xslt/news.xslt						\
		dtd/news.dtd						\
		dtd/content.dtd
	$(call XSLT, xslt/news.xslt, $<, $@, YEAR=2010)


$(OUT)/2009.html:	xml/index.xml					\
		xml/menu.xml						\
		xslt/news.xslt						\
		dtd/news.dtd						\
		dtd/content.dtd
	$(call XSLT, xslt/news.xslt, $<, $@, YEAR=2009)

$(OUT)/404.html:	xml/404.xml					\
		xml/menu.xml						\
		xslt/error.xslt						\
		dtd/article.dtd						\
		dtd/content.dtd
	$(call XSLT, xslt/error.xslt, $<, $@)


$(OUT)/%.html:		xml/%.xml					\
		$(ARTICLE_XSLT)
	$(call XSLT, xslt/article.xslt, $<, $@)


xslt/news.xslt:		xsls/news.xsls					\
		xslt/dirname.xslt					\
		xslt/link.xslt						\
		xslt/style.xslt						\
		xslt/body.xslt						\
		xslt/menu.xslt						\
		xslt/content.xslt
	$(call XSLScript, $<, $@)

xslt/article.xslt:	xsls/article.xsls				\
		xslt/dirname.xslt					\
		xslt/link.xslt						\
		xslt/style.xslt						\
		xslt/body.xslt						\
		xslt/menu.xslt						\
		xslt/donate.xslt					\
		xslt/content.xslt					\
		xslt/versions.xslt
	$(call XSLScript, $<, $@)

xslt/download.xslt:	xsls/download.xsls				\
		xslt/dirname.xslt					\
		xslt/link.xslt						\
		xslt/style.xslt						\
		xslt/body.xslt						\
		xslt/menu.xslt						\
		xslt/content.xslt
	$(call XSLScript, $<, $@)

xslt/security.xslt:	xsls/security.xsls				\
		xslt/dirname.xslt					\
		xslt/link.xslt						\
		xslt/style.xslt						\
		xslt/body.xslt						\
		xslt/menu.xslt						\
		xslt/content.xslt
	$(call XSLScript, $<, $@)

xslt/books.xslt:	xsls/books.xsls					\
		xslt/dirname.xslt					\
		xslt/link.xslt						\
		xslt/style.xslt						\
		xslt/body.xslt						\
		xslt/menu.xslt						\
		xslt/content.xslt
	$(call XSLScript, $<, $@)

xslt/error.xslt:	xsls/error.xsls
	$(call XSLScript, $<, $@)

xslt/%.xslt:		xsls/%.xsls
	$(call XSLScript, $<, $@)

images:									\
		binary/books/nginx_http_server_jp.jpg			\
		binary/books/nginx_1_web_server.jpg			\
		binary/books/nginx_http_server.jpg			\
		binary/books/nginx_in_practice.jpg

binary/books/nginx_http_server_jp.jpg:	sources/1106030720.jpg
	$(call JPEGNORM, $<, $@)

binary/books/nginx_1_web_server.jpg:					\
		sources/Nginx\ 1\ Web\ Server\ Implementation\ Cookbook.jpg
	$(call JPEGNORM, "$<", $@)

binary/books/nginx_http_server.jpg:	sources/0868OS_MockupCover.jpg
	$(call JPEGNORM, $<, $@)

binary/books/nginx_in_practice.jpg:	sources/20807089-1_o.jpg
	$(call JPEGNORM, $<, $@)


.PHONY:	gzip
gzip:	rsync_gzip
	$(MAKE) do_gzip

rsync_gzip:
	$(RSYNC) $(OUT)/ $(ZIP)/
	$(RSYNC) $(TEXT)/ $(ZIP)/

do_gzip:	$(addsuffix .gz, $(wildcard $(ZIP)/*.html))		\
		$(addsuffix .gz, $(wildcard $(ZIP)/en/*.html))		\
		$(addsuffix .gz, $(wildcard $(ZIP)/en/docs/*.html))	\
		$(addsuffix .gz, $(wildcard $(ZIP)/en/docs/http/*.html))\
		$(addsuffix .gz, $(wildcard $(ZIP)/ja/*.html))		\
		$(addsuffix .gz, $(wildcard $(ZIP)/ja/docs/*.html))	\
		$(addsuffix .gz, $(wildcard $(ZIP)/ja/docs/http/*.html))\
		$(addsuffix .gz, $(wildcard $(ZIP)/he/*.html))		\
		$(addsuffix .gz, $(wildcard $(ZIP)/he/docs/*.html))	\
		$(addsuffix .gz, $(wildcard $(ZIP)/he/docs/http/*.html))\
		$(addsuffix .gz, $(wildcard $(ZIP)/ru/*.html))		\
		$(addsuffix .gz, $(wildcard $(ZIP)/ru/docs/*.html))	\
		$(addsuffix .gz, $(wildcard $(ZIP)/tr/*.html))		\
		$(addsuffix .gz, $(wildcard $(ZIP)/tr/docs/*.html))	\
		$(addsuffix .gz, $(wildcard $(ZIP)/tr/docs/http/*.html))\
		$(ZIP)/index.rss.gz					\
		$(ZIP)/LICENSE.gz					\
		$(ZIP)/en/CHANGES.gz					\
		$(addsuffix .gz, $(wildcard $(ZIP)/en/CHANGES-?.?))	\
		$(ZIP)/ru/CHANGES.ru.gz					\
		$(addsuffix .gz, $(wildcard $(ZIP)/ru/CHANGES.ru-?.?))	\

	find $(ZIP)/ -type d -name .svn -prune				\
		-o -type f -not -name '*.gz' -exec test \! -e {}.gz \; -print


$(ZIP)/%.gz:		$(ZIP)/%
	$(call GZIP, $<)

dirs:
	test -d $(OUT)/en/docs/http || mkdir -p $(OUT)/en/docs/http

draft:	all
	$(RSYNC) $(OUT)/ $(NGINX_ORG)/$(OUT)/

copy:
	$(RSYNC) $(ZIP)/ $(NGINX_ORG)/
	$(RSYNC) binary/ $(NGINX_ORG)/

dev:	xslt/development.xslt sign
dev:	NGINX=$(shell xsltproc xslt/development.xslt xml/versions.xml)

stable:	xslt/stable.xslt sign
stable:	NGINX=$(shell xsltproc xslt/stable.xslt xml/versions.xml)

legacy:	xslt/legacy_stable.xslt sign
legacy:	NGINX=$(shell xsltproc xslt/legacy_stable.xslt xml/versions.xml)

any:	sign
any:	NGINX=0.7.69


sign:
	@echo sign nginx-$(NGINX)

	gpg -sab binary/download/nginx-$(NGINX).tar.gz
	gpg -sab binary/download/nginx-$(NGINX).zip


TEMP =	temp
SITE =	nginx.org

tarball:
	rm -rf $(TEMP)
	mkdir -p $(TEMP)/$(SITE)
	cp -Rp BSDmakefile GNUmakefile TODO				\
		xml xsls xslt dtd binary				\
	$(TEMP)/$(SITE)

	rm -f $(SITE).tar.bz2
	tar -c -y -f $(SITE).tar.bz2					\
		--directory $(TEMP)					\
		--exclude .svn						\
		$(SITE)
