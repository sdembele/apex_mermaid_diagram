function render_mermaid
  ( p_region              in apex_plugin.t_region
  , p_plugin              in apex_plugin.t_plugin
  , p_is_printer_friendly in boolean
  )
return apex_plugin.t_region_render_result
as
    l_result        apex_plugin.t_region_render_result;

    l_region_id     p_region.static_id%type    := p_region.static_id;
    
    --perform escaping
    l_region_id_esc p_region.static_id%type    := apex_escape.html_attribute(l_region_id);
    

begin

    --debug
    if apex_application.g_debug 
    then
        apex_plugin_util.debug_region
          ( p_plugin => p_plugin
          , p_region => p_region
          );
    end if;

    -- Load JS Libraries
    apex_javascript.add_library (p_name => 'mermaid.min', p_directory => p_plugin.file_prefix, p_version => null);
  
    -- Input item
    sys.htp.prn('<div contentEditable="true"');
    sys.htp.prn(' class="mermaid">');
    sys.htp.prn(apex_plugin_util.replace_substitutions(p_region.source));
    sys.htp.prn('</div>');

    -- Run onLoad code
    apex_javascript.add_inline_code (p_code => 'mermaid.initialize({
            startOnLoad: true
        });'
      );

    --initialize the plugin via JavaScript
    apex_json.initialize_clob_output;
    
    apex_json.open_object;
    
    apex_json.write('regionId'      , l_region_id );     -- needed for selecting the element
    apex_json.write('source_for_mermaid' , apex_plugin_util.replace_substitutions(p_region.source));
   
    
    apex_json.close_object;
    
    apex_javascript.add_onload_code(p_code => 'console.log('|| apex_json.get_clob_output || ');');
    
    apex_json.free_output;
    
    return l_result;
end render_mermaid;
