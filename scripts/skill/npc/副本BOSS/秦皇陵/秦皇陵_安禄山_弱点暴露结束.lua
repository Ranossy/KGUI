---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/�ػ���/�ػ���_��»ɽ_���㱩¶����.lua
-- ����ʱ��:	2014/1/22 10:52:23
-- �����û�:	ks13376-PC
-- �ű�˵��:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	--[[print("jieshu")
	local npc = GetNpc(dwCharacterID)
	if not npc then
		return
	end
	print("jieshu2")
	for i = 1, 2 do
		npc.AddBuff(0, 99, 7392, 1)
	end--]]
end

function UnApply(dwCharacterID)
end

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue)
	local npctarget = GetNpc(nCharacterID)
	if npctarget then
		local scene = npctarget.GetScene()
		local jieduankongzhi = scene.GetNpcByNickName("jieduanjiemiankongzhi")
		if jieduankongzhi then
			if jieduankongzhi.GetCustomInteger1(2) == 2 then
				if scene.dwMapID == 182 then
					for i = 1, 4 do
						npctarget.AddBuff(0, 99, 7392, 1)
					end
					npctarget.AddBuff(0, 99, 7605, 1)
				end

				if scene.dwMapID == 183 then
					for i = 1, 4 do
						npctarget.AddBuff(0, 99, 7392, 2)
					end
					npctarget.AddBuff(0, 99, 7605, 1)
				end
			end
		end
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com