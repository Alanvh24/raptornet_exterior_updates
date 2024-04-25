package com.utmir.raptornet.security.services;

import java.text.Normalizer;

public class StringUtils {

    public static String normalizeString(String input) {
        String normalized = Normalizer.normalize(input, Normalizer.Form.NFD);
        normalized = normalized.replaceAll("[\\p{InCombiningDiacriticalMarks}]", "");
        return normalized.toUpperCase();
    }

}
