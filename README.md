# Insert Plugin for Rails

This gem integrates [Medium Editor Insert Plugin](https://github.com/orthes/medium-editor-insert-plugin) with Rails asset pipeline.

## Version

The latest version of Medium Editor bundled by this gem is [v2.4.0](https://github.com/orthes/medium-editor-insert-plugin/releases)

## Installation

Include **medium-editor-insert-plugin** in your Rails project's Gemfile:

```ruby
gem 'medium-editor-rails'
gem 'medium-editor-insert-plugin'
```

And then execute:

```bash
bundle install
bundle exec rake insert_plugin:update
```

## Image uploading support

Install engine migrations

```bash
rails medium_editor_insert_plugin:install:migrations
rake db:migrate
```

Add to `config/routes.rb`
```ruby
mount MediumEditorInsertPlugin::Engine => "/medium-editor-insert-plugin"
```
You can skip this step, if your application has its own image uploader resource.

## Configuration

Include javascript file in **app/assets/javascripts/application.js**:

```javascript
//= require medium-editor
//= require medium-editor-insert-plugin
```

Include stylesheet file in **app/assets/stylesheets/application.css**:

```css
/*
*= require medium-editor
*= require medium-editor-insert-plugin
*/
```

Initialize and configure the plugin

```html
<div class="editable"></div>

<script>
  $(document).ready(function(){
    var editor = new MediumEditor('.editable', {
      // options go here
    });

    $('.editable').mediumInsert({
      editor: editor
    });
  });
</script>
```

Configure image uploading

```html
<div class="editable"></div>

<script>
  $(document).ready(function(){
    var editor = new MediumEditor('.editable', {
      // options go here
    });

    $('.editable').mediumInsert({
      editor: editor,
      addons: {
        images: {
          fileUploadOptions: {
            url: '/medium-editor-insert-plugin/images/upload',
            acceptFileTypes: /(.|\/)(gif|jpe?g|png)$/i
          },

          fileDeleteOptions: {
            url: '/medium-editor-insert-plugin/images/delete',
          }
        }
      }
    });

  });
</script>
```

If your application has its own image uploading endpoint on `/images/upload`, plugin configuration will look like:

```html
<script>
  $(document).ready(function(){
    var editor = new MediumEditor('.editable', {
      // options go here
    });

    $('.editable').mediumInsert({
      editor: editor,
      addons: {
        images: {
          fileUploadOptions: {
            url: '/images/upload',
            type: 'post',
            acceptFileTypes: /(.|\/)(gif|jpe?g|png)$/i
          },

          fileDeleteOptions: {
            url: '/images/delete',
          }
        }
      }
    });
  });
</script>
```
When upload path isn't specified, plugin stores image as binary data inside text.

## Contributing

1. Fork it ( https://github.com/mwlang/medium-editor-insert-plugin/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
