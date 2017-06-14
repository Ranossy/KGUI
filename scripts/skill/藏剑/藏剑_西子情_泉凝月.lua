---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/�ؽ�/�ؽ�_������_Ȫ����.lua
-- ����ʱ��:	2013/5/29 19:11:22
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  �ؽ�_������_Ȫ����.lua
-- ������    :  zhangqi	
-- ����ʱ��  :  2010-03-2
-- ��;(ģ��):  �书����
-- �书����  :  �ؽ�
-- �书����  :  �⹦
-- �书��·  :  ������
-- ��������  :  Ȫ����
-- ����Ч��  : ������Ȫ���£���Ȫˮʮ���徲��ˮ����Ӱ������һ�㡣
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nAddRage = 0, nCostRage = 0, nDamageBase = 20, 		nDamageRand = 3}, -- Level 1 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 27, 		nDamageRand = 4}, -- Level 2 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 34, 		nDamageRand = 4}, -- Level 3 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 41, 		nDamageRand = 5}, -- Level 4 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 48, 		nDamageRand = 6}, -- Level 5 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 55, 		nDamageRand = 7}, -- Level 6 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 62, 		nDamageRand = 7}, -- Level 7 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 69, 		nDamageRand = 8}, -- Level 8 
	
};           
             
--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
	
	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel;
	
	--skill.BindBuff(1, 5735, dwSkillLevel);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- ħ������
		"skill/�ؽ�/�ؽ�_������_Ȫ����.lua", -- ����ֵ1
		0														-- ����ֵ2
	);  
	----------------- ����CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	skill.SetPublicCoolDown(16);		
	skill.SetNormalCoolDown(1, 351);
	skill.SetCheckCoolDown(1, 444);
	----------------- ���ü������� ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
	
	----------------- ����������� ----------------------------------------------------------------------
   
	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;
	--	skill.nChannelInterval	= 32;
	skill.nMinRadius = 0 * LENGTH_BASE;					--����ʩ����С�뾶
	skill.nMaxRadius = 4 * LENGTH_BASE;							--����ʩ�����뾶
	skill.nAngleRange = 128; 										--ʩ�ŽǶ�,ȫ��256
	--skill.nAreaRadius		= 6 * LENGTH_BASE;	
	--skill.nWeaponDamagePercent	= 0;
	skill.nPrepareFrames = 0;										--����֡��,16֡����1��
    
	skill.nBulletVelocity = 0;										--�ӵ��ٶ�,��/֡
    
	skill.nBreakRate = 0;									--����ϵĸ���,Ĭ��1024��ʾһ�������
	--	skill.nTargetCountLimit	= 1;
	return true;
end


--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--Player: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    --�ж���ҵ�״̬�����ж��Ƿ���Է�������

end

function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)
	if skill.dwLevel == skill.dwMaxLevel then
		player.AcquireAchievement(3838)
	end
end
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end

	local nlev = player.GetSkillLevel(1666)
	if nlev ~= 0 then
		if player.GetSkillLevel(6541) == 1 then
			player.AddBuff(dwCharacterID, player.nLevel, 6143, 1, 30)
		else
			player.AddBuff(dwCharacterID, player.nLevel, 5735, nlev, 30)
		end

		--Ȫ�ڼ����
		if player.GetSkillLevel(14814) == 1 then
			player.AddBuff(player.dwID, player.nLevel, 9904, 1)
		end
	end

	--[[
	--��Ѫ����Ѫ
	if player.GetSkillLevel(6535) == 1 then
		if player.nCurrentLife <= player.nMaxLife * 0.3 then
			player.nCurrentLife = player.nCurrentLife + player.nMaxLife * 0.1
		end
	end
	--]]
	--Ȫ�ڼ�����20%
	if player.GetSkillLevel(6540) == 1 then
		player.AddBuff(dwCharacterID, player.nLevel, 6142, 1, 1)
	end
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com