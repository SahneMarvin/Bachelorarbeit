\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{tubaf-thesis}[2024-04-18 TUBAF class for theses (based on tubaf-report) by Max Weiner]

\DeclareKeys[tubaf-thesis]{
    approved.if = @tubaf@thesis@approved,
    signature-name-long.if = @tubaf@thesis@signaturenamelong,
    ai-usage.store = \tubaf@thesis@aiusage
}

\SetKeys[tubaf-thesis]{
    approved=false,
    signature-name-long = false,
    ai-usage=non-declare,
}

\DeclareUnknownKeyHandler[tubaf-thesis]{%
    \PassOptionsToClass{\CurrentOption}{tubaf-report}
}

\ProcessKeyOptions[tubaf-thesis]

\LoadClass{tubaf-report}
\RequirePackage{scrbase}
\RequirePackage{tabularray}
\RequirePackage{xstring}

\providecaptionname{english}{\tubaf@thesis@supervisorsname}{\IfSubStr{\tubaf@thesis@supervisors}{\and}{Supervisors}{Supervisor}}
\providecaptionname{ngerman}{\tubaf@thesis@supervisorsname}{Betreuer}

\providecaptionname{english}{\tubaf@thesis@examinersname}{\IfSubStr{\tubaf@thesis@examiners}{\and}{Examiners}{Examiner}}
\providecaptionname{ngerman}{\tubaf@thesis@examinersname}{Prüfer}

\providecaptionname{english}{\tubaf@thesis@reviewersname}{\IfSubStr{\tubaf@thesis@reviewers}{\and}{Revierwers}{Reviewer}}
\providecaptionname{ngerman}{\tubaf@thesis@reviewersname}{Gutachter}

\providecaptionname{english}{\tubaf@thesis@coursename}{Course}
\providecaptionname{ngerman}{\tubaf@thesis@coursename}{Studiengang}

\providecaptionname{english}{\tubaf@thesis@submittedby}{submitted by}
\providecaptionname{ngerman}{\tubaf@thesis@submittedby}{vorgelegt von}

\providecaptionname{english}{\tubaf@thesis@bornon}{born on}
\providecaptionname{ngerman}{\tubaf@thesis@bornon}{geboren am}

\providecaptionname{english}{\tubaf@thesis@submittedto}{submitted to the}
\providecaptionname{ngerman}{\tubaf@thesis@submittedto}{eingereicht der}

\providecaptionname{english}{\tubaf@thesis@approvedby}{approved by the}
\providecaptionname{ngerman}{\tubaf@thesis@approvedby}{genehmigt durch die}

\providecaptionname{english}{\tubaf@thesis@toattain}{to attain the academic degree of}
\providecaptionname{ngerman}{\tubaf@thesis@toattain}{zur Erlangung des akademischen Grades}

\providecaptionname{english}{\tubaf@thesis@dateofsubmission}{Date of submission}
\providecaptionname{ngerman}{\tubaf@thesis@dateofsubmission}{Tag der Einreichung}

\providecaptionname{english}{\tubaf@thesis@dateofaward}{Date of award}
\providecaptionname{ngerman}{\tubaf@thesis@dateofaward}{Tag der Verleihung}

\providecaptionname{english}{\tubaf@thesis@matriculationnumbername}{Matriculation-Number}
\providecaptionname{ngerman}{\tubaf@thesis@matriculationnumbername}{Matrikelnummer}

\providecaptionname{english}{\tubaf@thesis@declarationofauthorshipname}{Declaration of Authorship}
\providecaptionname{ngerman}{\tubaf@thesis@declarationofauthorshipname}{Selbstständigkeitserklärung}

\gdef\tubaf@thesis@supervisors{}
\newcommand{\supervisors}[1]{\gdef\tubaf@thesis@supervisors{#1}}

\gdef\tubaf@thesis@examiners{}
\newcommand{\examiners}[1]{\gdef\tubaf@thesis@examiners{#1}}

\gdef\tubaf@thesis@reviewers{}
\newcommand{\reviewers}[1]{\gdef\tubaf@thesis@reviewers{#1}}

\gdef\tubaf@thesis@course{}
\newcommand{\course}[1]{\gdef\tubaf@thesis@course{#1}}

\gdef\tubaf@thesis@faculty{}
\newcommand{\faculty}[1]{\gdef\tubaf@thesis@faculty{#1}}

\gdef\tubaf@thesis@currentdegree{}
\newcommand{\currentdegree}[1]{\gdef\tubaf@thesis@currentdegree{#1}}

\gdef\tubaf@thesis@attaineddegree{}
\gdef\tubaf@thesis@attaineddegree@short{}
\newcommand{\attaineddegree}[2][]{
    \gdef\tubaf@thesis@attaineddegree{#2}
    \IfArgIsEmpty{#1}{\gdef\tubaf@thesis@attaineddegree@short{#2}}{\gdef\tubaf@thesis@attaineddegree@short{#1}}
}

\gdef\tubaf@thesis@birthdate{}
\newcommand{\birthdate}[1]{\gdef\tubaf@thesis@birthdate{#1}}

\gdef\tubaf@thesis@birthplace{}
\newcommand{\birthplace}[1]{\gdef\tubaf@thesis@birthplace{#1}}

\gdef\tubaf@thesis@matriculationnumber{}
\newcommand{\matriculationnumber}[1]{\gdef\tubaf@thesis@matriculationnumber{#1}}

\newkomafont{faculty}{}
\newkomafont{attaineddegree}{\Large}
\setkomafont{author}{\Large}

\moretitle{
    \let\and\\
    \ifx\tubaf@thesis@faculty\empty\else
    \if@tubaf@thesis@approved
    \tubaf@thesis@approvedby
    \else
    \tubaf@thesis@submittedto
    \fi
    \\[5mm]
    {\usekomafont{faculty}\tubaf@thesis@faculty} \\[5mm]
    \fi
    \ifx\tubaf@thesis@attaineddegree\empty\else
    \tubaf@thesis@toattain \\[5mm]
    {\usekomafont{attaineddegree}\tubaf@thesis@attaineddegree \Ifstr{\tubaf@thesis@attaineddegree@short}{\tubaf@thesis@attaineddegree}{}{\ (\tubaf@thesis@attaineddegree@short)}} \\[5mm]
    \fi
    \tubaf@thesis@submittedby \\[5mm]
    {\usekomafont{author} \ifx\tubaf@thesis@currentdegree\empty\else\tubaf@thesis@currentdegree\ \fi \tubaf@thesis@author} \\[5mm]
    \ifx\tubaf@thesis@birthdate\empty\else\tubaf@thesis@bornon\ \tubaf@thesis@birthdate\ \ifx\tubaf@thesis@birthplace\empty\else in \tubaf@thesis@birthplace\fi\fi
}

\titlefoot{
    \let\and\\
    \edef\tubaf@thesis@foot@tablecontent{
        \ifx\tubaf@thesis@supervisors\empty\else
        \noexpand\tubaf@thesis@supervisorsname: & \tubaf@thesis@supervisors \\
        \fi
        \ifx\tubaf@thesis@examiners\empty\else
        \noexpand\tubaf@thesis@examinersname: & \tubaf@thesis@examiners \\
        \fi
        \if@tubaf@thesis@approved
        \ifx\tubaf@thesis@reviewers\empty\else
        \noexpand\tubaf@thesis@reviewersname: & \tubaf@thesis@reviewers \\
        \fi\fi
        \ifx\tubaf@thesis@course\empty\else
        \tubaf@thesis@coursename: & \tubaf@thesis@course \\
        \fi
        \ifx\tubaf@thesis@matriculationnumber\empty\else
        \tubaf@thesis@matriculationnumbername:    & \tubaf@thesis@matriculationnumber     \\
        \fi
        \if@tubaf@thesis@approved
        \tubaf@thesis@dateofaward: & \tubaf@thesis@date \\
        \else
        \tubaf@thesis@dateofsubmission: & \tubaf@thesis@date \\
        \fi
    }
    \begin{tblr}[expand=\tubaf@thesis@foot@tablecontent]{ll}
        \tubaf@thesis@foot@tablecontent
    \end{tblr}
}

\renewcommand{\tubaf@title@titlepage@prehook}{
    \let\tubaf@thesis@author\@author
    \let\tubaf@thesis@date\@date
    \let\@author\empty
    \let\@date\empty

    \renewcommand{\tubaf@title@titlepage@posthook}{
        \let\@author\tubaf@thesis@author
        \let\@date\tubaf@thesis@date
    }
}

\providecaptionname{ngerman}{\tubaf@thesis@declarationofauthorship@intro}{%
    Hiermit versichere ich, dass ich die vorliegende Arbeit
    \begin{center}
        \large
        \@title
    \end{center}
    selbst und ohne unzulässige Hilfe Dritter und ohne Benutzung anderer als der angegebenen oder zugelassenen Hilfsmittel angefertigt habe.
    Die aus fremden Quellen direkt oder indirekt übernommen Gedanken sind als solche kenntlich gemacht und nachgewiesen.
    Diese Versicherung bezieht sich auch auf die bildlichen Darstellungen.
    Ich versichere, dass die Arbeit den Prinzipien der guten wissenschaftlichen Praxis genügt.
}

\providecaptionname{ngerman}{\tubaf@thesis@declarationofauthorship@aiusage@none}{%
    In dieser Arbeit wurden keine KI-generierten Textpassagen oder Inhalte verwendet.
}

\providecaptionname{ngerman}{\tubaf@thesis@declarationofauthorship@aiusage@nondeclare}{%
    Ich versichere, dass ich keine KI-basierten Tools verwendet habe außer:
    \begin{itemize}
        \item Rechschreib- und Grammatikhilfen
        \item Suchmaschinen
        \item Automatische Übersetzer
    \end{itemize}
    Ich verantworte die Übernahme jeglicher von mir verwendeter maschinell generierter Passagen vollumfänglich selbst und trage die Verantwortung für eventuell durch die KI generierte fehlerhafte oder verzerrte Inhalte, fehlerhafte Referenzen, Verstöße gegen das Datenschutz- und Urheberrecht oder Plagiate.
    Ich versichere zudem, dass in der vorliegenden Arbeit mein gestalterischer Einfluss überwiegt.
}

\providecaptionname{ngerman}{\tubaf@thesis@declarationofauthorship@aiusage@declare}{%
    Im Anhang meiner Arbeit habe ich sämtliche KI-basierten Hilfsmittel einschließlich der Produktnamen und Verwendungszwecke angegeben.
    Ich versichere, dass ich keine KI-basierten Hilfsmittel verwendet habe außer, deren Nutzung die Prüferin, der Prüfer explizit schriftlich erlaubt hat.
    Ich verantworte die Übernahme jeglicher von mir verwendeter maschinell generierter Passagen vollumfänglich selbst und trage die Verantwortung für eventuell durch die KI generierte fehlerhafte oder verzerrte Inhalte, fehlerhafte Referenzen, Verstöße gegen das Datenschutz- und Urheberrecht oder Plagiate.
    Ich versichere zudem, dass in der vorliegenden Arbeit mein gestalterischer Einfluss überwiegt.
}

\providecaptionname{ngerman}{\tubaf@thesis@declarationofauthorship@outro}{%
    Ich habe die beigefügte Arbeit nicht zum Erwerb eines anderen Leistungsnachweises in gleicher oder ähnlicher Form eingereicht.
    Mir ist bekannt, dass ein Verstoß gegen die genannten Punkte prüfungsrechtliche Konsequenzen hat.
}

\providecaptionname{english}{\tubaf@thesis@declarationofauthorship@intro}{%
    I hereby declare that I have completed this work
    \begin{center}
        \large
        \@title
    \end{center}
    myself, without any unauthorized assistance from third parties and without using any resources other than those specified or permitted.
    Any ideas taken directly or indirectly from external sources have been identified and referenced as such.
    This assurance also applies to the visual representations.
    I affirm that the work complies with the principles of good scientific practice.
}

\providecaptionname{english}{\tubaf@thesis@declarationofauthorship@aiusage@none}{%
    No AI-generated text passages or content were used in this work.
}

\providecaptionname{english}{\tubaf@thesis@declarationofauthorship@aiusage@nondeclare}{%
    I confirm that I have not used any AI-based tools except:
    \begin{itemize}
        \item Spelling and grammar aids
        \item Search engines
        \item Automatic translators
    \end{itemize}
    I take full responsibility for any machine-generated passages I have used and am responsible for any incorrect or distorted content, incorrect references, violations of data protection and copyright laws, or plagiarism generated by AI.
    I also assure that my creative influence predominates in this work.
}

\providecaptionname{english}{\tubaf@thesis@declarationofauthorship@aiusage@declare}{%
    I have listed all AI-based tools used including the product names and their applications in the appendix to my thesis.
    I confirm that I have not used any AI-based tools except those explicitly permitted in writing by the examiner.
    I take full responsibility for any machine-generated passages I have used and am responsible for any incorrect or distorted content, incorrect references, violations of data protection and copyright laws, or plagiarism generated by AI.
    I also assure that my creative influence predominates in this work.
}

\providecaptionname{english}{\tubaf@thesis@declarationofauthorship@outro}{%
    I have not submitted the attached work to obtain another certificate of achievement in the same or a similar form.
    I am aware that any violation of the above points will have consequences under examination law.
}

\newcommand{\signaturefield}[2][7cm]{%
    \begin{minipage}[t]{#1}
        \raggedleft
        \rule{#1}{0.5pt}\\
        #2
    \end{minipage}
}

\NewDocumentCommand{\makedeclarationofauthorship}{O{\today} O{plain}}{%
    \chapter*{\tubaf@thesis@declarationofauthorshipname}
    \thispagestyle{#2}

    \tubaf@thesis@declarationofauthorship@intro

    \Ifstr{\tubaf@thesis@aiusage}{none}{%
        \tubaf@thesis@declarationofauthorship@aiusage@none
    }{%
        \Ifstr{\tubaf@thesis@aiusage}{non-declare}{%
            \tubaf@thesis@declarationofauthorship@aiusage@nondeclare
        }{%
            \Ifstr{\tubaf@thesis@aiusage}{declare}{%
                \tubaf@thesis@declarationofauthorship@aiusage@declare
            }{%
                \ClassError{tubaf-thesis}{Invalid value \tubaf@thesis@aiusage \space given for option 'ai-usage'}{Allowed values: none, non-declare, declare}
            }
        }
    }

    \tubaf@thesis@declarationofauthorship@outro

    \vspace{2cm}
    \noindent Freiberg, #1 \hfill \signaturefield{\if@tubaf@thesis@signaturenamelong\@author\else\tubaf@shortauthor\fi}\\
    \cleardoublepage
}
