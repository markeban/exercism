// This is a "stub" file.  It's a little start on your solution.
// It's not a complete solution though; you have to write some code.

// Package bob should have a package comment that summarizes what it's about.
// https://golang.org/doc/effective_go.html#commentary
package bob

import (
	"regexp"
	"strings"
)

// Hey should have a comment documenting it.
// func Hey(remark string) string {
// 	remark = strings.TrimSpace(remark)
// 	if isSilent(remark) {
// 		return "Fine. Be that way!"
// 	} else if isAngryQuestion(remark) {
// 		return "Calm down, I know what I'm doing!"
// 	} else if isAngryStatement(remark) {
// 		return "Whoa, chill out!"
// 	} else if isQuestion(remark) {
// 		return "Sure."
// 	}
// 	return "Whatever."
// }

type Remark struct {
	remark string
}

func newRemark(remark string) Remark {
	return Remark{strings.TrimSpace(remark)}
}

// Hey should have a comment documenting it.
func Hey(remark string) string {
	r := newRemark(remark)
	switch {
	case r.isSilent():
		return "Fine. Be that way!"
	// case isAngryQuestion(newRemark):
	// 	return "Calm down, I know what I'm doing!"
	// case isQuestion(newRemark):
	// 	return "Sure."
	default:
		return "Whatever."
	}
}

func (r *Remark) isSilent() bool {
	return r.remark == ""
}

// func isAngryQuestion(remark string) bool {
// 	return isQuestion(remark) && isAllCaps(remark) && hasLetters(remark)
// }

func isAngryStatement(remark string) bool {
	return isAllCaps(remark) && hasLetters(remark)
}

func isAllCaps(remark string) bool {
	return remark == strings.ToUpper(remark)
}

// func isQuestion(remark string) bool {
// 	return remark[len(remark)-1] == 63
// }

func hasLetters(remark string) bool {
	return regexp.MustCompile(`\p{L}`).MatchString(remark)
}
