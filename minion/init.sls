{%- from "minion/map.jinja" import minion, config with context -%}

copy_minion_configs:
  file.recurse:
    - name: {{ minion.get('path.linux', minion.path.linux) }}
    - source: {{ config.get('source', minion.source) }}
    - dir_mode: 0755
    - file_mode: 0744
    - user: root
    - group: root

minion_service:
  service.running:
    - name: {{ minion.service }}
    - enable: True
    - watch:
      - file: copy_minion_configs
