---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/���ܵ���/ʦͽϵͳ_������ɡ������Buff�ھ���.lua
-- ����ʱ��:	2013/3/4 11:19:15
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
end

function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	player.DoAction(0, 11483) 	--������ɡ����
	player.AddBuff(0, 99, 4186, 7)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com