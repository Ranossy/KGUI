---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/90����Ѩ/����_��ǽ������ʧ.lua
-- ����ʱ��:	2014/10/9 21:34:40
-- �����û�:	zhouyixiao2
-- �ű�˵��:
----------------------------------------------------------------------<
function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	--player.DelGroupBuff(8265, 1) --���
	--player.DelGroupBuff(8299, 1) -- ����
	--player.DelGroupBuff(8300, 1) --����
	for i = 1, 4 do
		player.DelBuff(8265, i) --���
		player.DelBuff(8299, i) --�ƶ��ٶ�
	end
	
	--��Ѩ���ж�ǽЧ����ʧ��ļ���
	if player.GetSkillLevel(13181) == 1 then
		player.AddBuff(player.dwID, player.nLevel, 8302, 1)
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com