---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/��������̰ħ��.lua
-- ����ʱ��:	2013/6/4 5:48:53
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	if player.GetSkillLevel(5977) == 1 then
		player.ClearCDTime(515)
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com