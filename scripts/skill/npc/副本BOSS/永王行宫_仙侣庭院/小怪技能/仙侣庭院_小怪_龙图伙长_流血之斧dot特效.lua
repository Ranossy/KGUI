---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/�����й�_����ͥԺ/С�ּ���/����ͥԺ_С��_��ͼ�ﳤ_��Ѫ֮��dot��Ч.lua
-- ����ʱ��:	2015/8/5 19:55:01
-- �����û�:	CHENJINGRU
-- �ű�˵��:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end

	player.PlaySfx(678, player.nX, player.nY, player.nZ + 500)
end

function UnApply(dwCharacterID)

end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com