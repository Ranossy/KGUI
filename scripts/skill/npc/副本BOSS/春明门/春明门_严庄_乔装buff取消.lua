---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/������/������_��ׯ_��װbuffȡ��.lua
-- ����ʱ��:	2014/5/15 16:25:08
-- �����û�:	ks13376-PC
-- �ű�˵��:
----------------------------------------------------------------------<
function Apply(dwCharacterID)

end

function UnApply(dwCharacterID)
end

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue)
	local playertarget = GetPlayer(nCharacterID)
	if playertarget then
		playertarget.SetDynamicSkillGroup(0)
		playertarget.PlaySfx(1013, playertarget.nX, playertarget.nY, playertarget.nZ)
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com