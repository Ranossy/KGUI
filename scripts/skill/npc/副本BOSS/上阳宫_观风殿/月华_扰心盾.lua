---------------------------------------------------------------------->
-- �ű�����:	scripts/Map/̫ԭ֮ս_������/skill/����/����buff.lua
-- ����ʱ��:	2014/7/14 17:04:12
-- �����û�:	ZHOUMING
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
  			--print(v.nAbsorbValue)
			--print(v.nAbsorbUsedValue)
		end
	end
		
end

-- ��һ�����ܷ�Ӧ�õ�ʱ�򴥷�(��BUFF��ʧ), ����Ϊ���õĶ���ID
function UnApply(dwCharacterID)
end
	
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com