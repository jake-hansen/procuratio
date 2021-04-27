package com.jakedhansen.procuratio.services;

import org.mindrot.jbcrypt.BCrypt;

public class PasswordService {

    public static class PasswordRequirementsNotMetException extends Exception {
        public PasswordRequirementsNotMetException(String s) {
            super(s);
        }
    }

    public static String hashPassword(String plaintextPassword) throws PasswordRequirementsNotMetException {
        validatePasswordRequirements(plaintextPassword);
        return BCrypt.hashpw(plaintextPassword, BCrypt.gensalt());
    }

    private static void validatePasswordRequirements(String password) throws PasswordRequirementsNotMetException {
        if (password.equals("")) {
            throw new PasswordRequirementsNotMetException("blank password not allowed");
        }
    }
}
