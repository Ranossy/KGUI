---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/��ѩ�����/��ѩ�����_��ӥ_����ŭ��_����.lua
-- ����ʱ��:	2014/1/17 10:33:43
-- �����û�:	wangpengfei1
-- �ű�˵��:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
end
function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if player then
		player.Stop()
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com