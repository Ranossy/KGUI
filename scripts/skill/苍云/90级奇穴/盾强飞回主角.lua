---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/90����Ѩ/��ǿ�ɻ�����.lua
-- ����ʱ��:	2014/10/16 16:58:05
-- �����û�:	zhouyixiao2
-- �ű�˵��:
----------------------------------------------------------------------<
--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	player.AddBuff(0, 99, 8399, 1, 1) --�ضܱ��

	if player.GetBuff(9176, 1) then
		player.DelBuff(9176, 1)
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com