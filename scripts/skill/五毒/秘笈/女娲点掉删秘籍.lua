---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/�嶾/����/Ů洵��ɾ�ؼ�.lua
-- ����ʱ��:	2013/4/29 17:17:34
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
	local character
	local tplayer
	local npc
	if IsPlayer(nCharacterID) then
		tplayer = GetPlayer(nCharacterID);
	else
		npc = GetNpc(nCharacterID);
	end

	if not (nLeftFrame == 0) then
		tplayer.DelBuff(3414, 1)
		tplayer.DelBuff(3415, 1)
		tplayer.DelBuff(3414, 2)
		tplayer.DelBuff(3415, 2)
		for i = 1, 4 do
			tplayer.DelBuff(3068, i)
		end
		tplayer.DelBuff(5778, 1)
	end
end;
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com