/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sit.main;

import sit.model.MD5;

/**
 *
 * @author Firsty
 */
public class MD5_Test {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        MD5 md = new MD5();
        String encPass = md.cryptWithMD5("24681357abc*");
        String encPassCut = md.cryptWithMD5("24681357abc*").replace("1", "").replace("2", "").replace("e", "").replace("c", "");
        System.out.println(encPass);
        System.out.println(encPassCut);
    }
    
}
