var defaultTitle = "Eclipse Theme Store from Jeeeyul";

Handlebars.registerHelper('session', function(key) {
	return Session.get(key);
});

Handlebars.registerHelper('currentURL', function(key) {
	return Router.current().url;
});

Handlebars.registerHelper("setTitle", function(title) {
	if (title) {
		document.title = title + " - " + defaultTitle;
	} else {
		document.title = defaultTitle;
	}
});