---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/��·���Ӽ���/�ܷ�����̬.lua
-- ����ʱ��:	2014/10/23 19:27:50
-- �����û�:	zhouyixiao2
-- �ű�˵��:
----------------------------------------------------------------------<
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	player.AddBuff(0, 99, 8278, 1, 1) --������̬
	local Time = 0
	--�ܷ��ӳ������ʱ��
	local tRecipeListSP = {1957, 1958}
	for i = 1, #tRecipeListSP do
		if player.IsSkillRecipeActive(tRecipeListSP[i],1) then
			Time = Time + 5
		end
	end

	player.AddBuff(0, 99, 8391, 1, 15 + Time) --����̬
	--RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "FireUIEvent", "DO_CUSTOM_OTACTION_PROGRESS", 16 * (15 + Time), "�ܷ�", 2)
	RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "ProgressBar.Start", "shield", 1, GetEditorString(6, 9257), GetCurrentTime() + 15 + Time, 15 + Time)
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com