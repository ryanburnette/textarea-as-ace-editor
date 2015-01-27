# textarea-as-ace-editor

Turn a textarea element into an instance of [Ace Editor][1] in a hurry.

## Usage

You'll need jQuery. Version 1.11.2 or 2+ recommended.

```html
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.11.2/jquery.js"></script>
```

You'll need Ace Editor. Load any additional themes or modules that you're using
too.

```html
<script src="https://cdnjs.cloudflare.com/ajax/libs/ace/1.1.3/ace.js"></script>
```

You'll need this plugin.

```html
<script src="dist/textarea-as-ace-editor.js"></script>
```

Call the plugin on a textarea and you're good to go.

```html
<script>
  $('textarea').asAceEditor();
</script>
```

If you know Ace Editor you can get the object from the textarea.

```javascript
editor = $('textarea').data('ace-editor');
```

## License

Apache2


[1]: http://ace.c9.io/
