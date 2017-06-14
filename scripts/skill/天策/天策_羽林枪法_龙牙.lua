---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/���/���_����ǹ��_����.lua
-- ����ʱ��:	2013/12/4 14:53:24
-- �����û�:	taoliJX3
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  ���_����ǹ��_����.lua
-- ������    :  ����
-- �޸���    �� ����־	
-- ����ʱ��  :  2008-03-04
-- �޸�ʱ��  �� 2008-06-04 
-- ��;(ģ��):  �书����
-- �书����  :  ���
-- �书����  :  �⹦
-- �书��·  :  ����ǹ��
-- ��������  :  ����
-- ����Ч��  :  ��Ŀ����ɴ����˺�,��������,�����Ƽ�Ч��
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nAddRage = 0, nCostRage = 10, nDamage = 70, nDamageRand = 5, }, -- Level 1 
	{nAddRage = 0, nCostRage = 10, nDamage = 75, nDamageRand = 5, }, -- Level 2 
	{nAddRage = 0, nCostRage = 10, nDamage = 80, nDamageRand = 5, }, -- Level 3 
	{nAddRage = 0, nCostRage = 10, nDamage = 85, nDamageRand = 5, }, -- Level 4 
	{nAddRage = 0, nCostRage = 10, nDamage = 90, nDamageRand = 5, }, -- Level 5 
	{nAddRage = 0, nCostRage = 10, nDamage = 92, nDamageRand = 5, }, -- Level 6 
	{nAddRage = 0, nCostRage = 10, nDamage = 94, nDamageRand = 5, }, -- Level 7 
	{nAddRage = 0, nCostRage = 10, nDamage = 96, nDamageRand = 5, }, -- Level 8 
	{nAddRage = 0, nCostRage = 10, nDamage = 98, nDamageRand = 5, }, -- Level 9 
	{nAddRage = 0, nCostRage = 10, nDamage = 100, nDamageRand = 5, }, -- Level 10
	{nAddRage = 0, nCostRage = 10, nDamage = 211 * 0.5, nDamageRand = 5, }, -- Level 11
	{nAddRage = 0, nCostRage = 10, nDamage = 224 * 0.5, nDamageRand = 10, }, -- Level 12
	{nAddRage = 0, nCostRage = 10, nDamage = 237 * 0.5, nDamageRand = 10, }, -- Level 13
	{nAddRage = 0, nCostRage = 10, nDamage = 250 * 0.5, nDamageRand = 10, }, -- Level 14
	{nAddRage = 0, nCostRage = 10, nDamage = 263 * 0.5, nDamageRand = 10, }, -- Level 15
	{nAddRage = 0, nCostRage = 10, nDamage = 276 * 0.5, nDamageRand = 10, }, -- Level 16
	{nAddRage = 0, nCostRage = 10, nDamage = 289 * 0.5, nDamageRand = 10, }, -- Level 17
	{nAddRage = 0, nCostRage = 10, nDamage = 302 * 0.5, nDamageRand = 10, }, -- Level 18
	{nAddRage = 0, nCostRage = 10, nDamage = 315 * 0.5, nDamageRand = 10, }, -- Level 19
	{nAddRage = 0, nCostRage = 10, nDamage = 328 * 0.5, nDamageRand = 15, }, -- Level 20
	{nAddRage = 0, nCostRage = 10, nDamage = 341 * 0.5, nDamageRand = 15, }, -- Level 21
	{nAddRage = 0, nCostRage = 10, nDamage = 354 * 0.5, nDamageRand = 15, }, -- Level 22
	{nAddRage = 0, nCostRage = 10, nDamage = 367 * 0.5, nDamageRand = 15, }, -- Level 23
	{nAddRage = 0, nCostRage = 10, nDamage = 380 * 0.5, nDamageRand = 15, }, -- Level 24
	{nAddRage = 0, nCostRage = 10, nDamage = 393 * 0.5, nDamageRand = 15, }, -- Level 25
	{nAddRage = 0, nCostRage = 10, nDamage = 406 * 0.5, nDamageRand = 15, }, -- Level 26
	{nAddRage = 0, nCostRage = 10, nDamage = 419 * 0.5, nDamageRand = 15, }, -- Level 27
	{nAddRage = 0, nCostRage = 10, nDamage = 432 * 0.5, nDamageRand = 15, }, -- Level 28
	{nAddRage = 0, nCostRage = 10, nDamage = 445 * 0.5, nDamageRand = 15, }, -- Level 29
}; 

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
	
	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel;
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE,
		tSkillData[dwSkillLevel].nDamage,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nDamageRand,
		0
	);
    
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_PHYSICS_DAMAGE,
		0,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.CONSUME_BUFF, -- ����Buff
		540, -- ����ֵ1
		0																-- ����ֵ2
	);
	--skill.AddAttribute(														--2010.05.08��ӳ��似��
		--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		--ATTRIBUTE_TYPE.CALL_BUFF,
		--2984,
		--1
	--);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- ħ������
		"skill/���/���_�����¼�_�����к�ˢ���Ʒ�.lua", -- ����ֵ1
		0														-- ����ֵ2
	);
	---��������AOEЧ��
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- ħ������
		"skill/���/���_����ǹ��_����.lua", -- ����ֵ1
		0														-- ����ֵ2
	);
	----------------- BUFF��� -------------------------------------------------
	--skill.BindBuff(1, 540, 2);			-- ����Buff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����Debuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);				-- ����Dot
	--skill.BindBuff(4, nBuffID, nBuffLevel);				-- ����Hot 
	----------------- ����CoolDown ---------------------------------------------------------------------
	----------------- ����CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	skill.SetPublicCoolDown(16);		--����CD1��
	skill.SetNormalCoolDown(1, 97);
	skill.SetCheckCoolDown(1, 444)
	----------------- ���ü������� ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
	if dwSkillLevel <= 6 then
		skill.nCostManaBasePercent = 280*0.2;	-- �������ĵ�����
	elseif dwSkillLevel <= 12 then
		skill.nCostManaBasePercent = 280 * 0.4;	-- �������ĵ�����
	elseif dwSkillLevel <= 18 then
		skill.nCostManaBasePercent = 280 * 0.5;
	elseif dwSkillLevel <= 24 then
		skill.nCostManaBasePercent = 280 * 0.8;
	else
		skill.nCostManaBasePercent = 280;
	end
	----------------- ���ü���ʩ��buff���� ----------------------------------------------------------------------
	skill.AddSlowCheckDestOwnBuff(540, 1, BUFF_COMPARE_FLAG.GREATER_EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);
	----------------- ����������� ----------------------------------------------------------------------
   
	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;
	
	skill.nWeaponDamagePercent = 1024;
	
	skill.nMinRadius = 0											--����ʩ����С�뾶
	skill.nMaxRadius = MELEE_ATTACK_DISTANCE;							--����ʩ�����뾶
	skill.nAngleRange = 128; 										--ʩ�ŽǶ�,ȫ��256
	if dwSkillLevel < 10 then
		skill.nChannelInterval = 100 * 1.1 * 1.1;
	elseif dwSkillLevel < 29 then
		skill.nChannelInterval = (100 + (dwSkillLevel - 9) * 5) * 1.1 *1.1
	else
		skill.nChannelInterval = 197 * 1.1 *1.1;     -- ͨ�������ʱ�� 
	end
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
	return nPreResult;
end

function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)
	--��������ָ������
	--local nQuestIndex = player.GetQuestIndex(13419)
	--local nQuestPhase = player.GetQuestPhase(13419)
	--if nQuestIndex and nQuestPhase == 1 then
		--player.SetQuestValue(nQuestIndex, 0, skill.dwLevel)
	--end
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
	local lv = player.GetSkillLevel(415)

	--������������ѪЧ��Ŀ�����10%�˺�
	if player.GetSkillLevel(15001) == 1 then
		local nlev_pofeng = player.GetSkillLevel(401)
		if nlev_pofeng ~= 0 and target.GetBuffByOwner(3442, nlev_pofeng, player.dwID) then
			player.CastSkill(15002,lv)
		end
	end

	if player.GetSkillLevel(5658) == 1 then
		target.AddBuff(dwSkillSrcID, player.nLevel, 5637, 1, 1)
		player.CastSkillXYZ(6063, lv, target.nX, target.nY, target.nZ)
		player.CastSkillXYZ(6069, lv, target.nX, target.nY, target.nZ)
		player.PlaySfx(472, target.nX, target.nY, target.nZ)
	end
	if player.GetSkillLevel(5688) == 1 then
		target.AddBuff(dwSkillSrcID, player.nLevel, 5643, 1, 1)
	end

	--���δ�Į��Ѩ���������ͷ���buff
	if player.GetSkillLevel(6869) == 1 and player.GetBuff(7657, 1) then
		target.AddBuff(dwSkillSrcID, player.nLevel, 7658, 1, 1)
	end

	--35%���ʲ������²�Ч��
	if player.GetSkillLevel(6517) == 1 and not player.GetBuff(9973, 1) then
		local nRnd = Random(1, 10000)
		if nRnd <= 3000 then
			target.AddBuff(player.dwID, player.nLevel, 540, 1)
			player.AddBuff(player.dwID, player.nLevel, 9973, 1)
		end
	end

	--��ѩ������Ѩ����������
	if player.GetSkillLevel(6511) == 1 then
		local newbuff = player.GetBuff(7671, 1)
		if newbuff then
			local nbuffcount = newbuff.nStackNum
			local nbuffleftframe = newbuff.nLeftActiveCount
			if nbuffcount < 4 then
				player.AddBuff(player.dwID,player.nLevel,7671,1,nbuffleftframe)
			end
		end
		--[[
		if player.GetBuff(7671, 3) then
			local newbuff = player.GetBuff(7671, 3)
			local nbuffcount = newbuff.nLeftActiveCount
			if nbuffcount ~= 0 then
				player.AddBuff(player.dwID, player.nLevel, 7671, 4, nbuffcount)
				player.DelBuff(7671, 3)
			end
		end
		if player.GetBuff(7671, 2) then
			local newbuff = player.GetBuff(7671, 2)
			local nbuffcount = newbuff.nLeftActiveCount
			if nbuffcount ~= 0 then
				player.AddBuff(player.dwID, player.nLevel, 7671, 3, nbuffcount)
				player.DelBuff(7671, 2)
			end
		end
		if player.GetBuff(7671, 1) then
			local newbuff = player.GetBuff(7671, 1)
			local nbuffcount = newbuff.nLeftActiveCount
			if nbuffcount ~= 0 then
				player.AddBuff(player.dwID, player.nLevel, 7671, 2, nbuffcount)
				player.DelBuff(7671, 1)
			end
		end
		--]]
	end
	
	local i = Random(1, 100)
	if i <= 15 then
		if player.GetSkillLevel(5665) == 1 then
			player.CastSkill(406, 1)
		end
	end

	if player.GetBuff(1911, 2) then
		target.AddBuff(dwSkillSrcID, player.nLevel, 540, 1)
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com