/*
 *  Copyright 2011 Smithsonian Astrophysical Observatory.
 * 
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 * 
 *       http://www.apache.org/licenses/LICENSE-2.0
 * 
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 *  under the License.
 */

package cfa.vo.utils;

import jsky.coords.DMS;
import jsky.coords.HMS;

/**
 *
 * @author olaurino
 */
public class SkyCoordinates {

    public static Double getRaDeg(String ra) {
        try {
            ra = SpaceTrimmer.sideTrim(ra);
            if(isNumber(ra))
                return Double.valueOf(ra);
            else {
                HMS hms = new HMS(ra);
                return hms.getVal();
            }
        } catch (Exception ex) {
            return Double.NaN;
        }
    }

    public static Double getDecDeg(String dec) {
        try {
            dec = SpaceTrimmer.sideTrim(dec);
            if(isNumber(dec))
                return Double.valueOf(dec);
            else {
                DMS dms = new DMS(dec);
                return dms.getVal();
            }
        } catch (Exception ex) {
            return Double.NaN;
        }
    }

    public static String getRaDegString(String ra) {
        return getRaDeg(ra).toString();
    }

    public static String getDecDegString(String dec) {
        return getDecDeg(dec).toString();
    }

    private static boolean isNumber(String string) {
        try {
            Double.parseDouble(string);
            return true;
        } catch (NumberFormatException ex) {
            return false;
        }
    }

}