---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/�ؽ�/�ؽ�_��ˮ����_�����´�.lua
-- ����ʱ��:	2013/5/12 14:14:31
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  �ؽ�_��ˮ����_�����´�.lua
-- ������    :  zhangqi	
-- ����ʱ��  :  2010-01-28
-- ��;(ģ��):  �书����
-- �书����  :  �ؽ�
-- �书����  :  �⹦
-- �书��·  :  ��ˮ����
-- ��������  :  �����´�
-- ����Ч��  :  �����´䣬������ˮ
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nAddRage = 20, nCostRage = 0, nDamageBase = 24, 	nDamageRand = 4}, -- Level 1 
	{nAddRage = 20, nCostRage = 0, nDamageBase = 37, 	nDamageRand = 6}, -- Level 2 
	{nAddRage = 20, nCostRage = 0, nDamageBase = 50, 	nDamageRand = 7}, -- Level 3 
	{nAddRage = 20, nCostRage = 0, nDamageBase = 63, 	nDamageRand = 8}, -- Level 4 
	{nAddRage = 20, nCostRage = 0, nDamageBase = 76, 	nDamageRand = 9}, -- Level 5 
	{nAddRage = 20, nCostRage = 0, nDamageBase = 89, 	nDamageRand = 11}, -- Level 6 
	{nAddRage = 20, nCostRage = 0, nDamageBase = 102, 	nDamageRand = 12}, -- Level 7 
	{nAddRage = 20, nCostRage = 0, nDamageBase = 115, 	nDamageRand = 13}, -- Level 8 
	{nAddRage = 20, nCostRage = 0, nDamageBase = 128, 	nDamageRand = 15}, -- Level 9 
	{nAddRage = 20, nCostRage = 0, nDamageBase = 141, 	nDamageRand = 16}, -- Level 10 
	{nAddRage = 20, nCostRage = 0, nDamageBase = 154, 	nDamageRand = 17},   	-- Level 11
	{nAddRage = 20, nCostRage = 0, nDamageBase = 167, 	nDamageRand = 19}, -- Level 12
	{nAddRage = 20, nCostRage = 0, nDamageBase = 180, 	nDamageRand = 20}, -- Level 13
	{nAddRage = 20, nCostRage = 0, nDamageBase = 193, 	nDamageRand = 21}, -- Level 14
	{nAddRage = 20, nCostRage = 0, nDamageBase = 206, 	nDamageRand = 22}, -- Level 15
	{nAddRage = 20, nCostRage = 0, nDamageBase = 219, 	nDamageRand = 24}, -- Level 16
	{nAddRage = 20, nCostRage = 0, nDamageBase = 232, 	nDamageRand = 25}, -- Level 17
	{nAddRage = 20, nCostRage = 0, nDamageBase = 245, 	nDamageRand = 26}, -- Level 18
	{nAddRage = 20, nCostRage = 0, nDamageBase = 258, 	nDamageRand = 28}, -- Level 19
	{nAddRage = 20, nCostRage = 0, nDamageBase = 271, 	nDamageRand = 29}, -- Level 20
	{nAddRage = 20, nCostRage = 0, nDamageBase = 284, 	nDamageRand = 30}, -- Level 21
	{nAddRage = 20, nCostRage = 0, nDamageBase = 297, 	nDamageRand = 32}, -- Level 22
	{nAddRage = 20, nCostRage = 0, nDamageBase = 310, 	nDamageRand = 33}, -- Level 23
	{nAddRage = 20, nCostRage = 0, nDamageBase = 323, 	nDamageRand = 34}, -- Level 24 
	{nAddRage = 20, nCostRage = 0, nDamageBase = 336, 	nDamageRand = 35}, -- Level 25
	{nAddRage = 20, nCostRage = 0, nDamageBase = 349, 	nDamageRand = 37}, -- Level 26

};           
             

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
	
	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel;
	--������ĳ�̼��ܱ��buff����
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_BUFF,
		7795,
		1
		);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CURRENT_RAGE,
		tSkillData[dwSkillLevel].nAddRage,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.DASH_TO_DST_BACK,
		32,
		0
		);
	--���˺�
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		13471,
		dwSkillLevel
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_BUFF,
		1687,
		3
	);--��ӻ�����������Buff
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- ħ������
		"skill/�ؽ�/�ؽ�_��ˮ����_�����´�.lua", -- ����ֵ1
		0														-- ����ֵ2
		);
	--��ħ�Ƽ�Ч��
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- ħ������
		"skill/�ؽ�/90����Ѩ/ƽ�������Ƽ�Ч��.lua", -- ����ֵ1
		0														-- ����ֵ2
	);
	----------------- ����CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	--skill.SetPublicCoolDown(16);		
	skill.SetNormalCoolDown(1, 335);
	skill.SetCheckCoolDown(1, 444)
	----------------- ���ü������� ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
	
	----------------- ����������� ----------------------------------------------------------------------
   
	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;
	if dwSkillLevel < 11 then
		skill.nChannelInterval = 16;
	elseif dwSkillLevel < 26 then
		skill.nChannelInterval = 16 + (dwSkillLevel -10) * 5
	else
		skill.nChannelInterval = 112;     -- ͨ�������ʱ��   
	end
	--skill.nChannelInterval = 112;
	skill.nMinRadius = 0 * LENGTH_BASE;					--����ʩ����С�뾶
	skill.nMaxRadius = 6 * LENGTH_BASE;							--����ʩ�����뾶
	skill.nAngleRange = 256; 										--ʩ�ŽǶ�,ȫ��256
	skill.nWeaponDamagePercent = 1024;
	skill.nPrepareFrames = 0;										--����֡��,16֡����1��
    
	skill.nBulletVelocity = 0;										--�ӵ��ٶ�,��/֡
    
	skill.nBreakRate = 0;									--����ϵĸ���,Ĭ��1024��ʾһ�������
   
	return true;
end


--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--Player: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    
--�ж���ҵ�״̬�����ж��Ƿ���Է�������
	if nPreResult ~= SKILL_RESULT_CODE.SUCCESS then
		return nPreResult 
	end
	local target = player.GetSelectCharacter()
	if target == nil then
		return false
	end
	local nTargetDirection = GetLogicDirection(target.nX - player.nX, target.nY - player.nY);
	local nPlayerDirection = player.nFaceDirection
	local nDirectionA = math.mod(nTargetDirection + 64 + 256, 256)
	local nDirectionB = math.mod(nTargetDirection-64 + 256, 256)

	if nPlayerDirection > nDirectionA or nPlayerDirection < nDirectionB then
		player.TurnTo(math.mod(nTargetDirection + 128, 256))
		return nPreResult;
	else
		return false;
	end
	return nPreResult;
end

function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)

end

function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	player.DelBuff(5890, 1)
	--[[
	if player.GetSkillLevel(5952) == 1 then
		if player.GetBuff(5727, 1) then
			player.AddBuff(dwCharacterID, player.nLevel, 5855, 1, 1)
			player.DelBuff(5727, 1)
		end
	end
	--]]
end
--
--function UnApply(dwCharacterID)
--end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com