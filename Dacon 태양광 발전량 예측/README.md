## 실험 기록
1. 전처리 없이 RandomForest : 2.336
2. 전처리 없이 SVM
3. 7일 자기회귀 + 30분 단위 + LGBM : 1.932
4. 7일 자기회귀 + 1시간 단위 + LGBM => **30분 단위로 고정** : 1.952
5. test 데이터 오류 수정 + 전처리 없이 RandomForest : 2.169
6. 7일 자기회귀 + 시간별 평균/사분위수 + LGBM : 1.943
7. CV + 7일 자기회귀 + 시간별 평균/사분위수 + LGBM => **validation이 오버피팅을 막아주는듯** : 1.974
8. CV + 7일 자기회귀 + 시간별 평균/사분위수 + LGBM(default) => LGBM random_states=100으로 해주니 갑자기 좋아지네? : 1.885
9. CV + 7일 자기회귀 + 시간별 평균/사분위수 + LGBM(default + dart) => dart는 별로 : 2.247
10. CV + 7일 자기회귀 + 시간별 평균/사분위수 + LGBM(default + n_estimators=1000) : 1.952
11. CV + 7일 자기회귀 + 시간별 평균/사분위수 + LGBM(GridSearch) : 2.112
12. CV + 7일 자기회귀 + 시간별 평균/사분위수 + LGBM(default + n_estimators=400 + num_leaves=100) => GridSearch 실패 : 1.958
13. CV + 7일 자기회귀 + 시간별 평균/사분위수 + LGBM(default + n_estimators=400 + num_leaves=100) => GridSearch 실패 : 1.935
14. CV + 7일 자기회귀 + 계절-시간별 평균/사분위수 + LGBM(default) : 1.877
15. CV + 7일 자기회귀 + 계절-시간별 평균/사분위수 + LGBM(default) + 스케일링 => **스케일링은 별로** : 1.881
16. CV + 7일 자기회귀 + 계절-시간별 발전량/일사량 평균/사분위수 + LGBM(default) : 1.880
17. CV + 7일 자기회귀 + 계절-시간별 발전량/일사량 평균/사분위수 + 7일 발전량/일사량 평균 + LGBM(default) : 1.867
18. CV + 7일 자기회귀 + 계절-시간별 발전량/일사량 평균/사분위수 + 7일 발전량/일사량 평균 + GHI only + LGBM(default) : 1.867
19. CV + 7일 자기회귀 + 계절-시간별 발전량/일사량 평균/사분위수 + 7일 발전량/일사량 평균 + GHI 제외, 대신 DHI + LGBM(default) => **GHI까지 다 때려박는게 좋음** : 1.877
20. **CV + 4일 자기회귀 + 계절-시간별 발전량/일사량 평균/사분위수 + 4일 발전량/일사량 평균 + LGBM(default) => 4일이 더 좋음 : 1.864**
21. CV + 4일 자기회귀 + 계절-시간별 발전량/일사량 평균 + 4일 발전량/일사량 평균 + LGBM(default) : 1.868
22. CV + 4일 자기회귀 + 계절-시간별 발전량/일사량 평균/사분위수 + 4일 발전량/일사량 평균 + RandomForest(default) : 1.966
23. CV + 4일 자기회귀 + 계절-시간별 발전량/일사량 평균/사분위수 + 4일 발전량/일사량 평균 + GradientBoosting(default) : 1.915
24. CV + 4일 자기회귀 + 계절-시간별 발전량/일사량 평균/사분위수 + 4일 발전량/일사량 평균 + GradientBoosting(n_estimators=500, max_depth=5, subsample=0.5) : 1.919
25. CV + 4일 자기회귀 + 계절-시간별 발전량/일사량 평균/사분위수 + 4일 발전량/일사량 평균 + RandomForest(scikit-garden)(n_estimators=10) : 2.129
26. CV + 4일 자기회귀 + 계절-시간별 발전량/일사량 평균/사분위수 + 4일 발전량/일사량 평균 + ExtraTreesForest(scikit-garden)(n_estimators=100) : 1.934
