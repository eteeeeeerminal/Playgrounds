import YAML from 'yaml'

const test_yaml = require('/contents/test.yaml') as string
const test_list = YAML.parse(test_yaml)

export default function LoadYaml() {
  return <ul>{
    test_list.map((v: string, i: number) => <li key={'li-'+i}>{v}</li>)
  }</ul>
}