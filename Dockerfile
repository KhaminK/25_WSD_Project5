# 1. 톰캣 9.0 버전을 기반으로 합니다.
FROM tomcat:9.0

# 2. (중요) 'src/main/webapp' 폴더 안의 모든 파일과 폴더를
#    톰캣 컨테이너의 'webapps/ROOT' 폴더로 복사합니다.
#    (image_e34dc2.png의 'webapp' 폴더 경로는 'src/main/webapp'입니다)
COPY src/main/webapp /usr/local/tomcat/webapps/ROOT/

# 3. 톰캣 서버를 실행합니다.
CMD ["catalina.sh", "run"]