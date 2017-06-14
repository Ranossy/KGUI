---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/������_�۷��/�»�_���Ķܱ�ը.lua
-- ����ʱ��:	2016/9/27 15:09:01
-- �����û�:	ZHANGGUANYI
-- �ű�˵��:
----------------------------------------------------------------------<
-- ��һ���������õ�ʱ�򴥷�, ����Ϊ���õĶ���ID
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	local table = player.GetAbsorbInfo()
	local scene = player.GetScene()
	if table then
		for k, v in ipairs(table) do
			--	print(v.nAbsorbType)
			--	print(v.nAbsorbValue)
			--	print(v.nAbsorbUsedValue)
			--player.nCurrentLife = player.nCurrentLife - v.nAbsorbUsedValue * 10
			local yuehua = scene.GetNpcByNickName("yuehua")
			if yuehua then
				if v.nAbsorbUsedValue > 0 then
					player.CustomDamage(yuehua.dwID, 16001, 1, 0, v.nAbsorbUsedValue * 0.5)

				end
				player.DelBuff(10771, 1)
			end
		end
	end

end

-- ��һ�����ܷ�Ӧ�õ�ʱ�򴥷�(��BUFF��ʧ), ����Ϊ���õĶ���ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com