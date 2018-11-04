/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sit.main;

import sit.javaModel.MD5;

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
        System.out.println(md.cryptWithMD5("12345678"));
        System.out.println(md.cryptWithMD5("sonasona"));
        System.out.println(md.cryptWithMD5("abcd1234"));
        System.out.println(md.cryptWithMD5("iloveecommerce"));
        System.out.println(md.cryptWithMD5("ALPHAbet"));
        System.out.println(md.cryptWithMD5("eiei5555"));
        System.out.println(md.cryptWithMD5("GoodGayBoi"));
        System.out.println(md.cryptWithMD5("0815275981"));
        System.out.println(md.cryptWithMD5("46441144941"));
        System.out.println(md.cryptWithMD5("Reader2222"));
        System.out.println(md.cryptWithMD5("0885552212"));
        System.out.println(md.cryptWithMD5("time_short"));
        System.out.println(md.cryptWithMD5("weil5678*_*"));
        System.out.println(md.cryptWithMD5("google123"));
        System.out.println(md.cryptWithMD5("worldofsheet"));
        System.out.println(md.cryptWithMD5("1111111111"));
        System.out.println(md.cryptWithMD5("makes_sense"));
        System.out.println(md.cryptWithMD5("200300400"));
        System.out.println(md.cryptWithMD5("thaNo@man_a"));
        System.out.println(md.cryptWithMD5("grnjvc,jcrhw,jwfh"));
    }
    
}