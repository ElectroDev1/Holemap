/*
Better function for getting a tilemap id that makes Holemap more compatible with things
like GMLive

yes I got this from YAL's GMLive's "cheat sheet", don't kill me
*/
function layer_tilemap_get_id_fixed(_layer) {
    var els = layer_get_all_elements(_layer);
    var n = array_length(els);
    for (var i = 0; i < n; i++) {
        var el = els[i];
        if (layer_get_element_type(el) == layerelementtype_tilemap) {
            return el;
        }
    }
    return -1;
}