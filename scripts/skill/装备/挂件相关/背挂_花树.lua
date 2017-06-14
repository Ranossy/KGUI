---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/װ��/�Ҽ����/����_����.lua
-- ����ʱ��:	2015/11/4 10:58:39
-- �����û�:	zhangyan3
-- �ű�˵��:
----------------------------------------------------------------------<

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")
Include("scripts/Map/������̬/����/include/����_�����ж�1.lua")

tSkillData =
{
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, -- level 1
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, -- level 2
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, -- level 3
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, -- level 4
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, -- level 5
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, -- level 6
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, -- level 7
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, -- level 8
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, -- level 9
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, -- level 10
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

 ----------------- ħ������ -------------------------------------------------
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/װ��/�Ҽ����/����_����.lua",
		0
	);

	skill.SetPublicCoolDown(16); -- ����CD 1.5��
	skill.SetPublicCoolDown(1009); -- 862	736

	skill.nMinRadius = 0 * LENGTH_BASE; -- ����ʩ�ŵ���С����
	skill.nMaxRadius = 4 * LENGTH_BASE; -- ����ʩ�ŵ�������
	skill.nAngleRange = 256; -- ������Χ�����νǶȷ�Χ
	return true;
end

-- �Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
-- Player: ����ʩ����, nPreResult: �������水��һ�������жϵĽ��
-- ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult) -- �ж���ҵ�״̬�����ж��Ƿ���Է�������
 -------------------------------------------------------
 -- ����ұ�������жϡ�BY��ͷ

 -- �жϵ��ߵı���ID
 -- dwRepresentID = player.GetRepresentID(nRepresentIndex)
 -- EQUIPMENT_REPRESENT.FACE_EXTEND		--��
 -- EQUIPMENT_REPRESENT.BACK_EXTEND   	--��
 -- EQUIPMENT_REPRESENT.WAIST_EXTEND   	--��
 -- EQUIPMENT_REPRESENT.L_SHOULDER_EXTEND	--���
 -- EQUIPMENT_REPRESENT.R_SHOULDER_EXTEND	--���
 -- EQUIPMENT_REPRESENT.BACK_CLOAK_EXTEND	--�������磩
 -- EQUIPMENT_REPRESENT.CHEST_STYLE			--��װ

 -- ����ǲ���װ�˹Ҽ����жϵ���ID
 -- ���������� player.dwBackItemIndex
 -- �沿������ player.dwFaceItemIndex
 -- ���������� player.dwWaistItemIndex
	------------------------------------------------------------
	if ArtistActionCheck(player, 16801) then
		return nPreResult
	end
	
	if player.dwBackItemIndex ~= 16801 then
		return false
	end
	--]]
 -- ��黻װ
	if player.dwModelID ~= 0 then
		return false
	end
 -- ���״̬
	if not (player.nMoveState == MOVE_STATE.ON_STAND) then
		return false
	end
 -- ���ս��
	if player.bFightState then
		return false
	end
 -- ������
	if player.bOnHorse then
		return false
	end

	return nPreResult;
end

-- ��������ʱ���ô˺���������skillΪ�������skill����һ�λ��ĳ������ʱҲ���ô˽ű�
function OnSkillLevelUp(skill, player)
end

--��������ʱִ�еĺ���,����skillΪ������skill
function OnSkillForgotten(skill, player)
end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	if not CustomFunction.CheckPlayerForRepresentApply(player) then
		return
	end
	--	
	if player.GetSingleRepresentID(EQUIPMENT_REPRESENT.BACK_EXTEND) == 300 then
		player.SetRepresentID(EQUIPMENT_REPRESENT.BACK_EXTEND, 0)
	end
	--]]
	local scene = player.GetScene()
	if not scene then
		return
	end
	
--	local dwAngel = (player.nFaceDirection * 360 / 256) / 180 * 3.14159265
--	local nX_goto = player.nX + 1 * 64 * math.cos(dwAngel)
--	local nY_goto = player.nY + 1 * 64 * math.sin(dwAngel)    	

	local szName_doodad = "hs_d20151104_" .. player.dwID
	
	local doodad1 = scene.GetDoodadByNickName(szName_doodad)
	if not doodad1 then
		----------���ﳡ��doodad�����غ����괦��-------------
		local doodad0 = scene.CreateDoodad(5832, player.nX + 50, player.nY + 50, player.nZ, player.nFaceDirection, szName_doodad)
		---------------------------------------------------------------
		if doodad0 then
			doodad0.SetDisappearFrames(33 * GLOBAL.GAME_FPS, 0)
		end
	end
	
	local szName_npc = "hs_n20151104_" .. player.dwID
	
	local npc1 = scene.GetNpcByNickName(szName_npc)
	if not npc1 then
		scene.CreateNpc(48199, player.nX+20, player.nY+20, player.nZ+500, player.nFaceDirection + 94, 30  * GLOBAL.GAME_FPS, szName_npc)
	end
	
	player.SetTimer(32 * GLOBAL.GAME_FPS, "scripts/skill/װ��/�Ҽ����/����_����.lua", 0, 0)	
	--player.DoAction(player.dwID, 13291) -- ����ID
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

function OnTimer(player, nParam1, nParam2)
	local scene = player.GetScene()
	if not scene then
		return
	end
	if player.dwBackItemIndex == 16801 then -- ����ǲ���װ�˱����Ҽ��������� EQUIPMENT_REPRESENT.WAIST_EXTEND
		player.SetRepresentID(EQUIPMENT_REPRESENT.BACK_EXTEND, 300)
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com