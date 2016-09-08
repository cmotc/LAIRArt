package main

import "bufio"
import "fmt"
import "image"
import "image/color"
import "image/png"
import "os"
import "strconv"
import s "strings"


func readLines(path string) ([]string, error) {
        file, err := os.Open(path)
        if err != nil {
                return nil, err
        }
        defer file.Close()
        var lines []string
        scanner := bufio.NewScanner(file)
        for scanner.Scan() {
                lines = append(lines, scanner.Text())
        }
        return lines, scanner.Err()
}

func containsAny(item string, colorsTest[] string) (bool){
        var r = false;
        var colorsPost []string = s.Split(colorsTest[0], ";")
        if s.Contains(item, colorsPost[1]) {
                fmt.Printf("  Found existing color : %f\n", item)
                r = true
        }
        return r
}

func generate (config string)(error){
        img := image.NewRGBA(image.Rect(0, 0, 32, 32))
        var file,err = readLines(config)
        var r error
        var COLORS []string
        for _,element := range file {
                if s.Contains(element, "point") {
                        var cleanElement = s.Replace(element, "point", "", -1)
                        var splitElement = s.Split( cleanElement, ";" )
                        var X int = -1
                        var Y int = -1
                        var R uint8 = 0
                        var G uint8 = 0
                        var B uint8 = 0
                        var T uint8 = 0
                        fmt.Printf("  Preliminary Point Summary : %f\n", element)
                        for _, cleaned := range splitElement {
                                if s.Contains(cleaned, "X") {
                                        var pX,err = strconv.ParseInt(s.Replace(cleaned, "X ", "", -1), 10, 8)
                                        if err != nil {  r = err }
                                        X = int(pX)
                                        fmt.Printf("  Point Summary X: %f\n", X)
                                }else if s.Contains(cleaned, "Y") {
                                        var pY,err = strconv.ParseInt(s.Replace(cleaned, "Y ", "", -1), 10, 8)
                                        if err != nil {  r = err }
                                        Y = int(pY)
                                        fmt.Printf("  Point Summary Y: %f\n", Y)
                                }else if s.Contains(cleaned, "R") {
                                        var pR,err = strconv.ParseInt(s.Replace(cleaned, "R ", "", -1), 10, 8)
                                        if err != nil {  r = err }
                                        R = uint8(pR)
                                        fmt.Printf("  Point Red : %f\n", R)
                                }else if s.Contains(cleaned, "G") {
                                        var pG,err = strconv.ParseInt(s.Replace(cleaned, "G ", "", -1), 10, 8)
                                        if err != nil {  r = err }
                                        G = uint8(pG)
                                        fmt.Printf("  Point Green : %f\n", G)
                                }else if s.Contains(cleaned, "B") {
                                        var pB,err = strconv.ParseInt(s.Replace(cleaned, "B ", "", -1), 10, 8)
                                        if err != nil {  r = err }
                                        B = uint8(pB)
                                        fmt.Printf("  Point Blue : %f\n", B)
                                }else if s.Contains(cleaned, "T") {
                                        var pT,err = strconv.ParseInt(s.Replace(cleaned, "T ", "", -1), 10, 8)
                                        if err != nil {  r = err }
                                        T = uint8(pT)
                                        fmt.Printf("  Point Alpha : %f\n", T)
                                }else if containsAny(element, COLORS) {
                                        var the_color = s.Split(element, ";")
                                        //fmt.Printf("  Color Alias : %f\n", the_color)
                                        for _, colorcleaned := range the_color {
                                                fmt.Printf("  Color Alias : %f\n", colorcleaned[0])
                                                if s.Contains(colorcleaned, "R") {
                                                        var pR,err = strconv.ParseInt(s.Replace(cleaned, "R ", "", -1), 10, 8)
                                                        if err != nil {  r = err }
                                                        R = uint8(pR)
                                                        fmt.Printf("  Point Summary : %f\n", R)
                                                }else if s.Contains(colorcleaned, "G") {
                                                        var pG,err = strconv.ParseInt(s.Replace(cleaned, "G ", "", -1), 10, 8)
                                                        if err != nil {  r = err }
                                                        G = uint8(pG)
                                                        fmt.Printf("  Point Summary : %f\n", G)
                                                }else if s.Contains(colorcleaned, "B") {
                                                        var pB,err = strconv.ParseInt(s.Replace(cleaned, "B ", "", -1), 10, 8)
                                                        if err != nil {  r = err }
                                                        B = uint8(pB)
                                                        fmt.Printf("  Point Summary : %f\n", B)
                                                }else if s.Contains(colorcleaned, "T") {
                                                        var pT,err = strconv.ParseInt(s.Replace(cleaned, "T ", "", -1), 10, 8)
                                                        if err != nil {  r = err }
                                                        T = uint8(pT)
                                                        fmt.Printf("  Point Summary : %f\n", T)
                                                }
                                        }
                                }
                        }
                        fmt.Printf(" Creating point : %f\n", cleanElement)
                        img.Set(X, Y, color.RGBA{R, G, B, T})
                }else if s.Contains(element, "color") {
                        element = s.Replace(element, "color", "", -1)
                        fmt.Printf(" Found new color : %f\n", element)
                        COLORS = append(COLORS, element)
                }
        }
        // Save to config.png
        var name = s.Replace(s.Replace(s.Replace(config, "/", "", -1), ".txt", "", -1), "skel", "", -1) + ".png"
        fmt.Printf("Saving PNG file : %f\n", name)
        f, _ := os.OpenFile(name, os.O_WRONLY|os.O_CREATE, 0600)
        defer f.Close()
        png.Encode(f, img)
        if err != nil {  r = err }
        return r
}

func main() {
        var cfg = "config.txt"
        var file,err = readLines(cfg)
        if err != nil {

        }
        fmt.Printf("Using config file : %f\n", cfg)
        for _,element := range file {
                if s.Contains(element, "path=") {
                        var path=s.Replace(element, "path=", "", -1)
                        fmt.Printf(" Using skeleton file : %f\n", path)
                        generate(path)
                } else {
                        generate("config.txt")
                }
        }
}
