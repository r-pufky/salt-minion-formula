{%- from "minion/map.jinja" import minion with context -%}

copy_minion_configs:
  file.recurse:
    - name: {{ minion.get('path.linux', minion.path.linux) }}
    - source: 'salt://minion/files'
    - dir_mode: 0755
    - file_mode: 0744
    - user: root
    - group: staff

minion_service:
  service.running:
    - name: {{ minion.service }}
    - enable: True
    - watch:
      - file: copy_minion_configs
