---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/���/���_����ǹ��_����.lua
-- ����ʱ��:	2013/5/9 15:04:37
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  ���_����ǹ��_����.lua
-- ������    :  ����	
-- ����ʱ��  :  2008-02-26 16:14	
-- ��;(ģ��):  �书����
-- �书����  :  ���
-- �书����  :  �⹦
-- �书��·  :  ����ǹ��
-- ��������  :  ����
-- ����Ч��  :  ��ǰĿ�����,��������ΧĿ��20��

--------------�ű��ļ���ʼ------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

--���ӳ���ݶ��ͼ����˺����
tSkillData = 
{
	{nCostMana = 98, nKnockedBackSpeed = 100, nKnockedBackDis = 20 * LENGTH_BASE, nBuffID = 724, nBuffLevel = 1, nDamage = 98 * 0.95, nDamageRand = 98 * 0.1}, -- Level 1
	{nCostMana = 126, nKnockedBackSpeed = 100, nKnockedBackDis = 20 * LENGTH_BASE, nBuffID = 724, nBuffLevel = 1, nDamage = 126 * 0.95, nDamageRand = 126 * 0.1}, -- Level 1
	{nCostMana = 153, nKnockedBackSpeed = 100, nKnockedBackDis = 20 * LENGTH_BASE, nBuffID = 724, nBuffLevel = 1, nDamage = 153 * 0.95, nDamageRand = 153 * 0.1}, -- Level 1
	{nCostMana = 181, nKnockedBackSpeed = 100, nKnockedBackDis = 20 * LENGTH_BASE, nBuffID = 724, nBuffLevel = 1, nDamage = 181 * 0.95, nDamageRand = 181 * 0.1}, -- Level 1
	
};


--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
	
	local bRetCode = false;
	local dwSkillLevel = 4;
	skill.BindBuff(2, 994, 2);
	skill.BindBuff(1, 724, 1);
	--[[
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_KNOCKED_DOWN,
		16,
		0
		);
	--]]
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- ħ������
		"skill/���/���_����ǹ��_����.lua", -- ����ֵ1
		0														-- ����ֵ2
	);
	--ʩ�� �Ӽ���_Ⱥ�����
	----------------- ����CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	skill.SetPublicCoolDown(16);		--����CD1��
	--�����_�����﷨_�Ѳ�� ��CD
	skill.SetNormalCoolDown(1, 197);
	skill.SetCheckCoolDown(1, 444)
	
	----------------- ���ü������� ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
	skill.nCostManaBasePercent = 288;	-- �������ĵ�����
	----------------- ����������� ----------------------------------------------------------------------
   
	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;
	skill.nWeaponDamagePercent = 0;
	skill.nMinRadius = 0											--����ʩ����С�뾶
	skill.nMaxRadius = MELEE_ATTACK_DISTANCE;							--����ʩ�����뾶
	skill.nAngleRange = 128; 										--ʩ�ŽǶ�,ȫ��256
    
	skill.nPrepareFrames = 0;										--����֡��,16֡����1��
    
	skill.nBulletVelocity = 0;										--�ӵ��ٶ�,��/֡
	
	skill.nDismountingRate = 1024;									--������Ϊ100%
	    
	skill.nBreakRate = 0;									--����ϵĸ���,Ĭ��1024��ʾһ�������
   
	return true;
end


--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--Player: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    
--�ж���ҵ�״̬�����ж��Ƿ���Է�������
	return nPreResult;
end

function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)
end
function Apply(dwCharacterID, dwSkillSrcID)
	local target
	if IsPlayer(dwCharacterID) then
		target = GetPlayer(dwCharacterID)
	else
		target = GetNpc(dwCharacterID)
	end
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end
	player.AddBuff(dwCharacterID, player.nLevel, 5864, 1, 1)
	local lv = player.GetSkillLevel(480)
	if lv == 0 then
		return
	end
	--������ǰĿ��
	player.CastSkill(13467, lv)
	
	if player.GetSkillLevel(5668) == 1 then
		player.CastSkill(6064, lv)
	else
		player.CastSkill(481, lv)
		if player.GetSkillLevel(5667) == 1 then
			--if not target.GetBuff(5638, 1) then
			--target.AddBuff(player.dwID, player.nLevel, 5638, 1, 1)
			--target.AddBuff(player.dwID, player.nLevel, 5639, 1, 1)
			player.AddBuff(dwCharacterID, player.nLevel, 5864, 1, 1)
			--end
		end
		if player.GetSkillLevel(5691) == 1 then
			if not IsPlayer(dwCharacterID) then
				target.ModifyThreat(dwCharacterID, 1200 * lv)
			end
		end
		if player.GetSkillLevel(5692) == 1 then
			player.CastSkill(6070, lv)
		end
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com