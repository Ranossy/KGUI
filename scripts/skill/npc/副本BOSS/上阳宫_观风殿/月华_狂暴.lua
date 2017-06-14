---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/������_�۷��/�»�_��.lua
-- ����ʱ��:	2016/10/2 17:20:20
-- �����û�:	ZHANGGUANYI
-- �ű�˵��:
----------------------------------------------------------------------<
-- ��һ���������õ�ʱ�򴥷�, ����Ϊ���õĶ���ID
function Apply(dwCharacterID)
	local npc = GetNpc(dwCharacterID)
	local scene = npc.GetScene()
	if scene then
		local tPlayer = scene.GetAllPlayer()
		for i = 1, #tPlayer do
			local playertar = GetPlayer(tPlayer[i])
			if playertar and playertar.nMoveState ~= MOVE_STATE.ON_DEATH then
				npc.PlaySfx(1425, playertar.nX, playertar.nY, playertar.nZ)
				playertar.CustomDamage(npc.dwID, 16506, 1, 0, playertar.nMaxLife * 10)
				playertar.Die()
			end
		end
	end
end

-- ��һ�����ܷ�Ӧ�õ�ʱ�򴥷�(��BUFF��ʧ), ����Ϊ���õĶ���ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com