---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/�ػ���/�ػ���_��»ɽ_�������.lua
-- ����ʱ��:	2014/2/11 14:58:41
-- �����û�:	ks13376-PC
-- �ű�˵��:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)

end

function UnApply(dwCharacterID)
	
end

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue)
	local npctarget = GetNpc(nCustomValue)
	if npctarget then
		local scene = npctarget.GetScene()
		if scene.dwMapID == 182 then
			npctarget.DelBuff(7416, 1)
		end

		if scene.dwMapID == 183 then
			npctarget.DelBuff(7416, 2)
		end
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com