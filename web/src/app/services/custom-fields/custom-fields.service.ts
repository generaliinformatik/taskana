import { Injectable } from '@angular/core';
import { CustomField } from '../../models/customField';

@Injectable()
export class CustomFieldsService {
  private customizedFields: any = {};

  initCustomFields(language: string = 'EN', jsonFile: any) {
    this.customizedFields = jsonFile[language];
  }

  getCustomField(fallbacktext: string, customPath?: string): CustomField {
    if (!customPath) {
      return new CustomField(true, fallbacktext);
    }
    return this.jsonPath(customPath, fallbacktext);
  }

  getCustomObject(fallbackObject: Object, customPath?: string): Object {
    if (!customPath) {
      return fallbackObject;
    }
    return this.jsonPathObject(customPath, fallbackObject);
  }

  private jsonPath(path: string, fallbacktext: string): CustomField {
    if (!this.customizedFields) {
      return new CustomField(true, fallbacktext);
    }
    const paths = path.split('.');
    let value = this.customizedFields;
    paths.every(element => {
      value = value[element];
      if (!value) {
        value = new CustomField(true, fallbacktext);
        return false;
      }
      return true;
    });

    return value;
  }


  private jsonPathObject(path: string, fallbackObject: Object): Object {
    if (!this.customizedFields) {
      return fallbackObject;
    }
    const paths = path.split('.');
    let value = this.customizedFields;
    paths.every(element => {
      value = value[element];
      if (!value) {
        value = fallbackObject;
        return false;
      }
      return true;
    });

    value = this.mergeKeys(value, fallbackObject);

    return value;
  }

  private mergeKeys(defaultObject: Object, newObject: Object) {
    const value = {};

    Object.keys(defaultObject).forEach(item => {
      value[item] = value[item] ? value[item] : defaultObject[item];
    });

    Object.keys(newObject).forEach(item => {
      value[item] = value[item] ? value[item] : newObject[item];
    });

    return value;
  }
}
