---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/�ػ���/�ػ���_��»ɽ_ͭƤ���Ǵ���.lua
-- ����ʱ��:	2014/1/22 15:22:59
-- �����û�:	ks13376-PC
-- �ű�˵��:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
end

function UnApply(dwCharacterID)
	--[[local npc = GetNpc(dwCharacterID)
	if not npc then
		return
	end
	
	if npc.GetBuff(7392, 1) then
		if npc.GetBuff(7392, 1).nStackNum == 1 then
			npc.AddBuff(0, 99, 7393, 1)
		end
	end--]]
end

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue)
	local npctarget = GetNpc(nCharacterID)
	if npctarget then
		local scene = npctarget.GetScene()
		local jieduankongzhi = scene.GetNpcByNickName("jieduanjiemiankongzhi")
		if jieduankongzhi then
			if jieduankongzhi.GetCustomInteger1(2) == 2 then
				if scene.dwMapID == 182 then
					npctarget.AddBuff(0, 99, 7393, 1, 20)
					npctarget.DelBuff(7605, 1)
				end

				if scene.dwMapID == 183 then
					npctarget.AddBuff(0, 99, 7393, 2, 20)
					npctarget.DelBuff(7605, 1)
				end
			end
		end
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com