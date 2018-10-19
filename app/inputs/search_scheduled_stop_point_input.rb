class SearchScheduledStopPointInput < Formtastic::Inputs::SearchInput

  def search
    if options[:json]
      tokenLimit = options[:tokenLimit].present? ? options[:tokenLimit] : "null"
      template.content_tag(:script,
                           ("$(document).ready(function() {

           var item_name = function( item){
              var result='';
              if ( item.stop_area_name ) {
                 result = item.stop_area_name;
              }

              return result;
           };

           var item_stop_point_object_id = function(item){
              var result='';
              if(item.stop_point_object_id){
                  result = item.stop_point_object_id;
              }

              return result;
            };

           var item_localization = function( item){
              var localization = item.stop_area_zip_code + ' ' + item.stop_area_short_city_name;
              return localization;
           };

          var result_format = function(item) {
              var name=item_name(item);
               if (item.name){
                name += ' <small>[' + item.name + ']</small>';
              }

              var stop_point_object_id = item_stop_point_object_id(item);
              if (item.stop_point_object_id){
                item_id += ' <small>[' + item.stop_point_object_id + ']</small>';
              }

              return item_format(item, name, stop_point_object_id);
          };

          var token_format = function(item) {
              var name=item_name(item);
              var stop_point_object_id = item_stop_point_object_id(item);
              return item_format(item, name, stop_point_object_id);
          };

           var item_format = function( item, name, stop_point_object_id ){
              if (item && item.id) {
                var localization = item_localization( item );

                html_result = '<li>';
                html_result += '<span><image src=\"' + item.stop_area_path + '\" height=\"25px\" width=\"25px\"></span>'
                if(name != '')
                {
                  html_result += '<span style=\"height:25px; line-height:25px; margin-left: 5px; \">' + name + '</span>' ;
                }

                if(stop_point_object_id != '')
                {
                  html_result += '<span style=\"height:25px; line-height:25px; margin-left: 5px; \">' + stop_point_object_id + '</span>' ;
                }

                if(localization != '')
                {
                  html_result += '<small style=\"height:25px; line-height:25px; margin-left: 10px; color: #555; \">' + localization + '</small>';
                }
                html_result += '</li>';
               } else {
                  html_result=''
              }
              return html_result;
           };

            var add_item = function(item) {
              if (item) {
                var scheduled_stop_point_name_input= $('##{dom_id}'.replace('scheduled_stop_point_id_or_stop_area_objectid_key','scheduled_stop_point_name'));
                scheduled_stop_point_name_input.val(item.name);
              }

              var sspInUseWarning= $('##{dom_id}').parent().parent().find('#sspInUseWarning');
              if (item && item.stop_point_cnt > 0) {
                sspInUseWarning.removeClass('hidden');
              } else  {
                sspInUseWarning.addClass('hidden');
              }
            };

           $('##{dom_id}').tokenInput('#{options[:json]}', {
             zindex: 1061,
             disabled: #{options[:disabled] || false},
             crossDomain: false,
             tokenLimit: #{tokenLimit},
             minChars: 2,
             preventDuplicates: true,
             hintText: '#{options[:hint_text]}',
             noResultsText: '#{options[:no_result_text]}',
             searchingText: '#{options[:searching_text]}',
             resultsFormatter: result_format,
             tokenFormatter: token_format,
             onAdd: add_item,
           });
        });").html_safe)
    end
  end

  def to_html

     sspInUseDisplayClass = ((object && object.scheduled_stop_point && object.scheduled_stop_point.stop_points.size>1) ? '' : 'hidden');

    input_wrapping do
      label_html <<
          builder.search_field(method, input_html_options) <<
           ssp_in_use_warning.html_safe <<
          search
    end
  end

  def ssp_in_use_warning
    sspInUseDisplayClass = ((object && object.scheduled_stop_point && object.scheduled_stop_point.stop_points.size>1) ? '' : 'hidden');

    '<span id="sspInUseWarning" class="ievkit-ColorBlock-warning-sign glyphicon glyphicon-warning-sign '+ sspInUseDisplayClass+'"   data-toggle="tooltip"  data-placement="right"
  title="'+ I18n.t("routes.show.scheduled_stop_point_in_use_warning")+'"></span>'
  end

  def input_html_options
    css_class = super[:class]
    super.merge({
                    :required => nil,
                    :autofocus => nil,
                    :class => "#{css_class} token-input",
                    'data-model-name' => (object.nil? || object.class.nil?) ? 'Chouette::ScheduledStopPoint' : object.class.model_name.human
                })
  end

end
