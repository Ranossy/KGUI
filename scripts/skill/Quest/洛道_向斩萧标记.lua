---------------------------------------------------
-- �ű��ļ���scripts\skill\Quest\���_��ն�����.lua
---------------------------------------------------
--NPC������SetDisappearFrames����ʱBUFF�Ƴ������Ƴ�ʱ���ó�������

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
	local npc = GetNpc(nCharacterID)
	local scene = npc.GetScene()
	if not scene then
		return
	end
	scene.SetCustomUnsigned4(30 * 4, 0)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com